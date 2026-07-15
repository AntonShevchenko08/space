$proj = "space-encyclopedia-temp"
Remove-Item -Recurse -Force $proj -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path "$proj\assets\images" -Force | Out-Null

# Files: write the three files (you can paste the contents from the chat into these)
Set-Content -Path "$proj\index.html" -Value @'
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
'@

Set-Content -Path "$proj\styles.css" -Value @'
/* paste styles.css contents here */
'@

Set-Content -Path "$proj\main.js" -Value @'
// paste main.js contents here
'@

# Download images
Invoke-WebRequest -Uri "https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?auto=format&fit=crop&w=256&q=60" -OutFile "$proj\assets\images\logo.png"
Invoke-WebRequest -Uri "https://images.unsplash.com/photo-1444703686981-a3abbc4d4fe3?auto=format&fit=crop&w=1600&q=80" -OutFile "$proj\assets\images\hero.jpg"
Invoke-WebRequest -Uri "https://images.unsplash.com/photo-1462331940025-496dfbfc7564?auto=format&fit=crop&w=800&q=80" -OutFile "$proj\assets\images\earth.jpg"
Invoke-WebRequest -Uri "https://images.unsplash.com/photo-1472214103451-9374bd1c798e?auto=format&fit=crop&w=800&q=80" -OutFile "$proj\assets\images\mars.jpg"
Invoke-WebRequest -Uri "https://images.unsplash.com/photo-1508610048659-a06f9b2f3d0f?auto=format&fit=crop&w=800&q=80" -OutFile "$proj\assets\images\jupiter.jpg"

# Create zip
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory($proj, "space-encyclopedia.zip")
Write-Host "Zip created: space-encyclopedia.zip"
