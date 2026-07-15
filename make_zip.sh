#!/usr/bin/env bash
set -e

ZIPNAME="space-encyclopedia.zip"
PROJECT_DIR="space-encyclopedia-temp"

echo "Creating project folder: ${PROJECT_DIR}"
rm -rf "$PROJECT_DIR"
mkdir -p "$PROJECT_DIR/assets/images"

# Write files
cat > "$PROJECT_DIR/index.html" <<'HTML'
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title data-i18n="site.title">Space Encyclopedia</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&family=Space+Mono&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <header class="site-header">
    <div class="header-inner">
      <div class="brand">
        <img src="assets/images/logo.png" alt="logo" class="logo">
        <h1 data-i18n="site.title">Space Encyclopedia</h1>
      </div>

      <nav class="nav">
        <a href="#" data-i18n="nav.home">Home</a>
        <a href="#planets" data-i18n="nav.planets">Planets</a>
        <a href="#about" data-i18n="nav.about">About</a>
      </nav>

      <div class="lang-switch">
        <label for="lang" class="sr-only" data-i18n="lang.select">Select language</label>
        <select id="lang" aria-label="Language">
          <option value="en">English</option>
          <option value="uk">Українська</option>
        </select>
      </div>
    </div>
  </header>

  <main>
    <section class="hero" id="home" style="background-image:url('assets/images/hero.jpg')">
      <div class="hero-inner">
        <h2 data-i18n="hero.title">Explore the planets and stars</h2>
        <p data-i18n="hero.subtitle">A small friendly encyclopedia about our solar neighborhood and beyond.</p>
      </div>
    </section>

    <section id="planets" class="section planets-section">
      <h2 data-i18n="featured.title">Featured Planets</h2>

      <div class="cards">
        <article class="card">
          <img src="assets/images/earth.jpg" alt="Earth" data-i18n-alt="planet.earth.name">
          <h3 data-i18n="planet.earth.name">Earth</h3>
          <p data-i18n="planet.earth.desc">Our home — the third planet from the Sun with liquid water and a rich biosphere.</p>
        </article>

        <article class="card">
          <img src="assets/images/mars.jpg" alt="Mars" data-i18n-alt="planet.mars.name">
          <h3 data-i18n="planet.mars.name">Mars</h3>
          <p data-i18n="planet.mars.desc">The red planet — dusty, cold and the subject of many exploration missions.</p>
        </article>

        <article class="card">
          <img src="assets/images/jupiter.jpg" alt="Jupiter" data-i18n-alt="planet.jupiter.name">
          <h3 data-i18n="planet.jupiter.name">Jupiter</h3>
          <p data-i18n="planet.jupiter.desc">A gas giant with a massive storm (the Great Red Spot) and many moons.</p>
        </article>
      </div>
    </section>

    <section id="about" class="section about-section">
      <h2 data-i18n="nav.about">About</h2>
      <p data-i18n="about.text">This demo site is a tiny encyclopedia about planets and stars — built for learning and exploration.</p>
    </section>
  </main>

  <footer class="site-footer">
    <p data-i18n="footer.text">Made with curiosity • Images from Unsplash</p>
  </footer>

  <script src="main.js"></script>
</body>
</html>
HTML

cat > "$PROJECT_DIR/styles.css" <<'CSS'
/* styles.css - modest, hand-written feel */

/* basic reset-ish */
* { box-sizing: border-box; margin: 0; padding: 0; }
html,body { height: 100%; }

body {
  font-family: 'Roboto', system-ui, -apple-system, 'Segoe UI', Roboto, 'Helvetica Neue', Arial;
  line-height: 1.45;
  color: #eaf6ff;
  background: radial-gradient(ellipse at bottom, #00111a 0%, #00020a 50%), #000014;
  min-height: 100%;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

/* subtle star-like dots using CSS gradients */
body::before {
  content: "";
  position: fixed;
  inset: 0;
  background-image:
    radial-gradient(white 1px, transparent 1px),
    radial-gradient(white 2px, transparent 2px);
  background-size: 200px 200px, 500px 500px;
  opacity: 0.03;
  pointer-events: none;
}

/* header */
.site-header {
  padding: 12px 20px;
  background: linear-gradient(180deg, rgba(255,255,255,0.02), rgba(255,255,255,0.01));
  border-bottom: 1px solid rgba(255,255,255,0.03);
  position: sticky;
  top: 0;
  z-index: 10;
}

.header-inner {
  max-width: 1100px;
  margin: 0 auto;
  display: flex;
  gap: 16px;
  align-items: center;
  justify-content: space-between;
}

/* brand */
.brand { display:flex; align-items:center; gap:10px; }
.logo { width:48px; height:48px; object-fit:cover; border-radius:8px; }

/* nav */
.nav a {
  color: #dff7ff;
  text-decoration: none;
  margin-left: 14px;
  font-weight: 500;
  opacity: 0.95;
}
.nav a:hover { text-decoration: underline; opacity: 1; }

/* language selector */
.lang-switch select {
  background: rgba(255,255,255,0.04);
  color: #eaf6ff;
  border: 1px solid rgba(255,255,255,0.06);
  padding: 6px 8px;
  border-radius: 6px;
}

/* hero */
.hero {
  display:flex;
  align-items:center;
  justify-content:center;
  height: 42vh;
  min-height: 260px;
  background-size: cover;
  background-position: center;
  margin: 20px auto;
  max-width: 1100px;
  border-radius: 12px;
  box-shadow: 0 8px 30px rgba(0,0,0,0.6);
  position: relative;
  overflow: hidden;
}
.hero-inner {
  background: linear-gradient(90deg, rgba(0,10,20,0.4), rgba(0,0,0,0.1));
  padding: 28px;
  border-radius: 8px;
}
.hero h2 { font-family: 'Space Mono', monospace; font-size: 1.8rem; margin-bottom: 8px; }
.hero p { opacity: 0.9; }

/* sections */
.section {
  max-width: 1100px;
  margin: 28px auto;
  padding: 0 18px;
}

/* cards */
.cards {
  display:grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 18px;
  margin-top: 14px;
}

.card {
  background: linear-gradient(180deg, rgba(255,255,255,0.02), rgba(255,255,255,0.01));
  border-radius: 10px;
  padding: 12px;
  border: 1px solid rgba(255,255,255,0.03);
  transition: transform 0.18s ease, box-shadow 0.18s ease;
}
.card:hover { transform: translateY(-6px); box-shadow: 0 12px 30px rgba(0,0,0,0.5); }
.card img { width:100%; height:140px; object-fit:cover; border-radius:6px; margin-bottom:10px; }

/* footer */
.site-footer {
  max-width: 1100px;
  margin: 40px auto;
  padding: 16px 18px;
  color: #bfefff;
  opacity: 0.8;
  font-size: 0.95rem;
}

/* small helpers */
.sr-only { position: absolute !important; width:1px; height:1px; padding:0; overflow:hidden; clip:rect(1px,1px,1px,1px); white-space:nowrap; border:0; }

/* responsive tweaks */
@media (max-width:600px) {
  .header-inner { padding: 0 6px; gap:10px; }
  .hero-inner { padding: 18px; }
  .hero h2 { font-size: 1.3rem; }
}
CSS

cat > "$PROJECT_DIR/main.js" <<'JS'
// main.js - simple language switcher and small DOM helpers
// Author: a friendly dev (hand‑written comments included)

// Translations: English (en) and Ukrainian (uk)
const translations = {
  en: {
    "site.title": "Space Encyclopedia",
    "nav.home": "Home",
    "nav.planets": "Planets",
    "nav.about": "About",
    "lang.select": "Select language",
    "hero.title": "Explore the planets and stars",
    "hero.subtitle": "A small friendly encyclopedia about our solar neighborhood and beyond.",
    "featured.title": "Featured Planets",
    "planet.earth.name": "Earth",
    "planet.earth.desc": "Our home — the third planet from the Sun with liquid water and a rich biosphere.",
    "planet.mars.name": "Mars",
    "planet.mars.desc": "The red planet — dusty, cold and the subject of many exploration missions.",
    "planet.jupiter.name": "Jupiter",
    "planet.jupiter.desc": "A gas giant with a massive storm (the Great Red Spot) and many moons.",
    "about.text": "This demo site is a tiny encyclopedia about planets and stars — built for learning and exploration.",
    "footer.text": "Made with curiosity • Images from Unsplash"
  },
  uk: {
    "site.title": "Енциклопедія Космосу",
    "nav.home": "Головна",
    "nav.planets": "Планети",
    "nav.about": "Про проект",
    "lang.select": "Оберіть мову",
    "hero.title": "Досліджуйте планети та зірки",
    "hero.subtitle": "Невелика дружня енциклопедія про нашу Сонячну систему та за її межами.",
    "featured.title": "Обрані планети",
    "planet.earth.name": "Земля",
    "planet.earth.desc": "Наш дім — третя планета від Сонця з рідиною водою та багатою біосферою.",
    "planet.mars.name": "Марс",
    "planet.mars.desc": "Червона планета — піщана, холодна і об'єкт багатьох досліджень.",
    "planet.jupiter.name": "Юпітер",
    "planet.jupiter.desc": "Газовий гігант з величезною бурею (Велика Червона Пляма) і численними супутниками.",
    "about.text": "Демонстраційний сайт — невелика енциклопедія про планети та зірки, створена для навчання.",
    "footer.text": "Зроблено з цікавістю • Зображення з Unsplash"
  }
};

// helper: apply translations to DOM elements with data-i18n
function applyTranslations(lang) {
  // set document title (if element has data-i18n in <title>, update content)
  document.querySelectorAll('[data-i18n]').forEach(el => {
    const key = el.getAttribute('data-i18n');
    if (translations[lang] && translations[lang][key]) {
      el.textContent = translations[lang][key];
    }
  });

  // update alt attributes if element has data-i18n-alt
  document.querySelectorAll('[data-i18n-alt]').forEach(img => {
    const key = img.getAttribute('data-i18n-alt');
    if (translations[lang] && translations[lang][key]) {
      img.alt = translations[lang][key];
    }
  });

  // update the <title> tag itself (it's a special case)
  const titleKey = document.querySelector('title')?.getAttribute('data-i18n');
  if (titleKey && translations[lang] && translations[lang][titleKey]) {
    document.title = translations[lang][titleKey];
  }
}

// initialization
(function init() {
  const select = document.getElementById('lang');

  // load from localStorage or default to 'en'
  const saved = localStorage.getItem('site_lang') || 'en';
  select.value = saved;
  applyTranslations(saved);

  // on change, persist and re-apply
  select.addEventListener('change', (e) => {
    const lang = e.target.value;
    localStorage.setItem('site_lang', lang);
    applyTranslations(lang);
  });
})();
JS

# download images
echo "Downloading images..."
curl -L -o "$PROJECT_DIR/assets/images/logo.png" "https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?auto=format&fit=crop&w=256&q=60"
curl -L -o "$PROJECT_DIR/assets/images/hero.jpg" "https://images.unsplash.com/photo-1444703686981-a3abbc4d4fe3?auto=format&fit=crop&w=1600&q=80"
curl -L -o "$PROJECT_DIR/assets/images/earth.jpg" "https://images.unsplash.com/photo-1462331940025-496dfbfc7564?auto=format&fit=crop&w=800&q=80"
curl -L -o "$PROJECT_DIR/assets/images/mars.jpg" "https://images.unsplash.com/photo-1472214103451-9374bd1c798e?auto=format&fit=crop&w=800&q=80"
curl -L -o "$PROJECT_DIR/assets/images/jupiter.jpg" "https://images.unsplash.com/photo-1508610048659-a06f9b2f3d0f?auto=format&fit=crop&w=800&q=80"

# create zip
echo "Creating zip: ${ZIPNAME}"
cd "$PROJECT_DIR"
zip -r "../${ZIPNAME}" ./*
cd ..
echo "ZIP created: ${ZIPNAME}"
