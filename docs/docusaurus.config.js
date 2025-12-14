// @ts-check
import { themes as prismThemes } from "prism-react-renderer";

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: "eDemand Documentation",
  tagline: "Documentation for eDemand",
  favicon: "img/favicon.ico",
  url: 'https://wrteam-in.github.io',
  baseUrl: '/eDemand-Doc',
  onBrokenLinks: "warn",
  onBrokenMarkdownLinks: "warn",
  organizationName: 'WRTeam-in', // Usually your GitHub org/user name.
  projectName: 'eDemand-Doc', // Usually your repo name.

  i18n: {
    defaultLocale: "en",
    locales: ["en"],
  },

  plugins: [
    require.resolve("@easyops-cn/docusaurus-search-local"),
  ],

  presets: [
    [
      "classic",
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: "./sidebars.js",
        },
        blog: {
          showReadingTime: true,
          feedOptions: {
            type: ["rss", "atom"],
            xslt: true,
          },
          editUrl:
            "https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/",
          onInlineTags: "warn",
          onInlineAuthors: "warn",
          onUntruncatedBlogPosts: "warn",
        },
        theme: {
          customCss: "./src/css/custom.css",
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      image: "img/edemand.svg",
      navbar: {
        // title: "eDemand",
        logo: {
          alt: "eDemand Logo",
          src: "img/edemand.svg",
          srcDark: "img/edemand-white.png",
        },
        items: [
          {
            type: "docSidebar",
            sidebarId: "adminSidebar",
            position: "left",
            label: "Admin",
          },
          {
            to: "/docs/website-setup/web-intro",
            label: "Website",
            position: "left",
          },
          {
            type: "docSidebar",
            sidebarId: "appSidebar",
            position: "left",
            label: "App",
          },
          {
            type: "docSidebar",
            sidebarId: "featuresSidebar",
            position: "left",
            label: "Features",
          },
          {
            to: "/docs/changelog",
            label: "Changelog",
            position: "left",
          },
          {
            to: "/docs/support",
            label: "Community Support",
            position: "left",
          },
          {
            to: "/docs/faqs",
            label: "FAQs",
            position: "left",
          },
          {
            type: 'search',
            position: 'right',
          },
        ],
      },
      footer: {
        style: "dark",
        copyright: `Copyright ${new Date().getFullYear()} eDemand.`,
      },
      colorMode: {
        defaultMode: "dark",
      },
      prism: {
        darkTheme: prismThemes.dracula,
      },
    }),
};

export default config;