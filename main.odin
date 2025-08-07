package main

import rl "vendor:raylib"

SCREEN_WIDTH :: 1280
SCREEN_HEIGHT :: 720

main :: proc() {
	// Initialize window
	rl.SetConfigFlags({.MSAA_4X_HINT})
	rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Main")
	rl.SetTargetFPS(60)
	defer rl.CloseWindow()

	// State
	x: i32 = SCREEN_WIDTH / 2
	y: i32 = SCREEN_HEIGHT / 2

	// Main game loop
	for !rl.WindowShouldClose() {
		// Update logic
		if (rl.IsKeyDown(rl.KeyboardKey.UP)) {
			y -= 5
		}
		if (rl.IsKeyDown(rl.KeyboardKey.DOWN)) {
			y += 5
		}
		if (rl.IsKeyDown(rl.KeyboardKey.LEFT)) {
			x -= 5
		}
		if (rl.IsKeyDown(rl.KeyboardKey.RIGHT)) {
			x += 5
		}

		// Draw logic
		rl.BeginDrawing()
		rl.ClearBackground(rl.SKYBLUE)
		rl.DrawCircle(x, y, 64, rl.WHITE)
		rl.EndDrawing()
	}
}
