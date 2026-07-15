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
