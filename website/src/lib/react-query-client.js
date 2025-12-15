"use client";

import { QueryClient } from "@tanstack/react-query";
import { store } from "@/redux/store";

// Centralize React Query defaults so every query stays predictable.
// Keeping this in one place also means ops like language changes only need a single touch-point.
const DEFAULT_STALE_TIME = 5 * 60 * 1000; // 5 minutes
const DEFAULT_GC_TIME = 10 * 60 * 1000; // 10 minutes

export const defaultQueryOptions = {
  queries: {
    // Use generous defaults across the app; individual queries can override when needed.
    staleTime: DEFAULT_STALE_TIME,
    gcTime: DEFAULT_GC_TIME,
    refetchOnWindowFocus: false,
    refetchOnMount: false,
    refetchOnReconnect: false,
    retry: 1,
  },
  mutations: {
    retry: 1,
  },
};

let queryClient;

export const getQueryClient = () => {
  if (!queryClient) {
    // Lazily create a single client instance for the entire app.
    queryClient = new QueryClient({
      defaultOptions: defaultQueryOptions,
    });
  }
  return queryClient;
};

export const buildLanguageAwareKey = (baseKey = []) => {
  // Always include current language in the key so caches remain language-specific.
  let languageCode = "en";
  try {
    const state = store.getState();
    languageCode = state?.translation?.currentLanguage?.langCode || "en";
  } catch (error) {
    // Store not ready yet, use default
    console.warn("Store not ready for language key, using default 'en'");
  }
  return [...baseKey, { lang: languageCode.toLowerCase() }];
};

