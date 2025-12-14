import React, { useEffect, useRef } from 'react';
import clsx from 'clsx';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import styles from './index.module.css';

function HomepageHeader() {
  const { siteConfig } = useDocusaurusContext();
  const heroRef = useRef(null);
  const lastMousePos = useRef({ x: 0, y: 0 });
  const velocity = useRef({ x: 0, y: 0 });

  // SVG path helper
  const getIconPath = (idx) => {
    switch (idx) {
      case 0: // Wrench/Settings
        return "M22.7 19.3l-2.1-2.1c.5-1 .8-2.1.8-3.2 0-4.4-3.6-8-8-8-1.1 0-2.2.3-3.2.8L4.7 1.3 3.3 2.7l2.1 2.1C4.9 6.1 4.6 7.2 4.6 8.3c0 4.4 3.6 8 8 8 1.1 0 2.2-.3 3.2-.8l2.1 2.1 1.4-1.4z";
      case 1: // Calendar
        return "M7 10h10M7 14h6M5 4h14a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2zm2-2v4m10-4v4";
      case 2: // User/Provider
        return "M12 12c2.7 0 5-2.3 5-5s-2.3-5-5-5-5 2.3-5 5 2.3 5 5 5zm0 2c-3.3 0-10 1.7-10 5v3h20v-3c0-3.3-6.7-5-10-5z";
      case 3: // Home
        return "M3 12l9-9 9 9M4 10v10a1 1 0 0 0 1 1h3m6 0h3a1 1 0 0 0 1-1V10";
      case 4: // Chat/Support
        return "M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z";
      case 5: // Credit Card/Payment
        return "M2 7h20M2 11h20M2 15h20M4 19h16a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2z";
      case 6: // Star/Rating
        return "M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z";
      default:
        return "";
    }
  };

  useEffect(() => {
    const hero = heroRef.current;
    if (!hero) return;

    // Create and animate a floating icon
    const createIcon = (x, y, velocityX = 0, velocityY = 0) => {
      const el = document.createElement('div');
      el.className = styles.cursorIcon;
      const randomIcon = Math.floor(Math.random() * 7); // 0-6 for 7 icons
      const size = Math.random() * 6 + 18; // 18-24px
      el.innerHTML = `<svg width="${size}" height="${size}" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d='${getIconPath(randomIcon)}' stroke='currentColor' stroke-width='1.2' fill='none'/></svg>`;
      // Position
      const angle = Math.random() * Math.PI * 2;
      const distance = Math.random() * 20 + 5;
      const offsetX = Math.cos(angle) * distance;
      const offsetY = Math.sin(angle) * distance;
      el.style.left = `${x + offsetX}px`;
      el.style.top = `${y + offsetY}px`;
      el.style.position = 'fixed';
      el.style.pointerEvents = 'none';
      el.style.color = 'rgba(255,255,255,0.85)';
      el.style.transform = 'scale(0) rotate(0deg)';
      el.style.transition = 'all 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275)';
      el.style.filter = 'blur(0px)';
      el.style.opacity = '0';
      document.body.appendChild(el);
      // Animate
      const rotation = (Math.random() - 0.5) * 180;
      const moveX = (Math.random() - 0.5) * 60 + velocityX;
      const moveY = -Math.random() * 60 - 30 + velocityY;
      requestAnimationFrame(() => {
        el.style.transform = `scale(1) rotate(${rotation}deg) translate(${moveX}px, ${moveY}px)`;
        el.style.opacity = '1';
        el.style.filter = 'blur(0.5px)';
      });
      setTimeout(() => {
        el.remove();
      }, 800);
    };

    // Mouse move handler
    const handleMouseMove = (e) => {
      const currentX = e.clientX;
      const currentY = e.clientY;
      velocity.current = {
        x: currentX - lastMousePos.current.x,
        y: currentY - lastMousePos.current.y
      };
      lastMousePos.current = { x: currentX, y: currentY };
      const speed = Math.sqrt(velocity.current.x ** 2 + velocity.current.y ** 2);
      const numIcons = Math.min(Math.floor(speed / 8), 3);
      for (let i = 0; i < numIcons; i++) {
        setTimeout(() => {
          createIcon(currentX, currentY, velocity.current.x, velocity.current.y);
        }, i * 40);
      }
    };
    // Mouse enter handler
    const handleMouseEnter = (e) => {
      for (let i = 0; i < 8; i++) {
        setTimeout(() => {
          createIcon(e.clientX, e.clientY);
        }, i * 40);
      }
    };
    hero.addEventListener('mousemove', handleMouseMove);
    hero.addEventListener('mouseenter', handleMouseEnter);
    return () => {
      hero.removeEventListener('mousemove', handleMouseMove);
      hero.removeEventListener('mouseenter', handleMouseEnter);
    };
  }, []);

  return (
    <header ref={heroRef} className={styles.heroBanner}>
      <div className={styles.heroContent}>
        <img src="/eDemand-Doc/img/edemand-white.png" alt="eDemand Logo" className={styles.heroLogo} />
        <h1 className={styles.heroTitle}>{siteConfig.title}</h1>
        <p className={styles.heroSubtitle}>
          Comprehensive documentation for eDemand covering installation, setup, features, and support.
        </p>
        <Link className={styles.heroButton} to="/docs/introduction">
          Get Started
        </Link>
      </div>
    </header>
  );
}

function HomepageFeatures() {
  // You can update the icons as you wish
  const cards = [
    {
      icon: <span className={clsx(styles.cardIcon, styles.cardIconCyan)}>🛠️</span>,
      title: 'Admin Documentation',
      desc: 'Complete backend and admin panel setup instructions for efficient management.',
      link: '/docs/admin-setup/admin-intro',
      button: 'Admin Panel Setup',
    },
    {
      icon: <span className={clsx(styles.cardIcon, styles.cardIconBlue)}>🌐</span>,
      title: 'Website Documentation',
      desc: 'Step-by-step guide for setting up and customizing your eDemand website.',
      link: '/docs/website-setup/web-intro',
      button: 'Website Setup',
    },
    {
      icon: <span className={clsx(styles.cardIcon, styles.cardIconGreen)}>📱</span>,
      title: 'App Documentation',
      desc: 'Comprehensive guide for configuring and launching the eDemand mobile app.',
      link: '/docs/app-setup/app-intro',
      button: 'Mobile App Setup',
    },
    {
      icon: <span className={clsx(styles.cardIcon, styles.cardIconYellow)}>✨</span>,
      title: 'Features',
      desc: 'Explore all features available for different user roles in eDemand.',
      link: '/docs/features/elegant-home-page',
      button: 'Explore Features',
    },
  ];
  return (
    <section className={styles.cardSection}>
      <div className={styles.cardGrid}>
        {cards.map((card, idx) => (
          <div className={styles.cardModern} key={idx}>
            {card.icon}
            <h2 className={styles.cardTitle}>{card.title}</h2>
            <p className={styles.cardDescription}>{card.desc}</p>
            <Link className={styles.cardButton} to={card.link}>{card.button}</Link>
          </div>
        ))}
      </div>
    </section>
  );
}

function SupportSection() {
  return (
    <section className={styles.supportSection}>
      <h3 className={styles.supportTitle}>Need Help?</h3>
      <p className={styles.supportText}>Our support team is ready to assist you with any questions or issues.</p>
      <div className={styles.supportButtons}>
        <Link className={styles.supportBtn} to="/docs/support">Support</Link>
        <Link className={clsx(styles.faqsBtn)} to="/docs/faqs">FAQs</Link>
      </div>
    </section>
  );
}

function BannerSection() {
  return (
    <section className={styles.bannerSection}>
      <a
        href="https://api.whatsapp.com/send?phone=918200323468&text=Hello%20Jignesh%2C%20I%20want%20to%20know%20more%20about%20the%20installation%20service%20for%20eDemand"
        target="_blank"
        rel="noopener noreferrer"
        className={styles.bannerLink}
      >
        <img
          src="/eDemand-Doc/img/installation.webp"
          alt="Installation Service"
          className={styles.bannerImage}
        />
      </a>
    </section>
  );
}

export default function Home() {
  const { siteConfig } = useDocusaurusContext();
  return (
    <Layout title={siteConfig.title} description={siteConfig.tagline}>
      <HomepageHeader />
      <main>
        <HomepageFeatures />
        <SupportSection />
        <BannerSection />
      </main>
    </Layout>
  );
}
