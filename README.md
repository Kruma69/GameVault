# GameVault – Flutter App

GameVault es una aplicación desarrollada con **Flutter** que permite gestionar una biblioteca personal de videojuegos.  
Incluye navegación por pestañas, una pantalla para añadir juegos y componentes visuales modulares.

---

## Características principales

- **Navegación con TabBar** (Juegos, Favoritos, Categorías)
- **Pantalla para añadir juegos** (`AddGameScreen`)
- **SnackBar de confirmación** al añadir un título
- **Drawer lateral funcional**
- Widgets separados para una mejor organización:
  - `GamesGrid`
  - `CategoriesList`
  - `AppDrawer`

---

##  Ejecutar el proyecto

```bash
git clone https://github.com/tuusuario/gamevault.git
cd gamevault
flutter pub get
flutter run
