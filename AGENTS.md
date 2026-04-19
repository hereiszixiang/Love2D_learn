# AGENTS.md - Love2D Learning Project

## Running the Game

```bash
# Install Love2D first: https://love2d.org/
# Then run from project root:
love .
```

Or use VS Code with the "Debug Custom Lua Environment" launch config.

## Project Structure

- **Entry point**: `main.lua` - standard Love2D callbacks (`love.load`, `love.update`, `love.draw`, `love.keypressed`)
- **Config**: `conf.lua` - `t.console = true` shows print output in terminal
- **Libraries**: `libs/classic.lua` (OOP), `libs/tick.lua` (timing/utilities)
- **Assets**: `assets/images/` - game sprites (sheep.png, snake.png, bullet.png, panda.png)

## Love2D Basics

The framework injects a global `love` table with all functions. The VS Code settings already mark `love` as a global to avoid false diagnostics.

Key callbacks:
- `love.load()` - runs once at startup
- `love.update(dt)` - runs every frame, `dt` = delta time in seconds
- `love.draw()` - runs every frame for rendering
- `love.keypressed(key)` - keyboard input

## Common Gotchas

- `love.keypressed` reports key names like `"space"`, `"up"`, `"return"`, not scancodes
- Use `dt` (delta time) for frame-rate independent movement: `position = position + speed * dt`
- Images must be loaded in `love.load`, not at module require time
- Coordinate system: (0,0) is top-left, Y increases downward