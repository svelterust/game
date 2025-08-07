package main

import "base:runtime"

import "core:c"
import "core:log"

import rl "vendor:raylib"
import stbsp "vendor:stb/sprintf"

SCREEN_WIDTH :: 1280
SCREEN_HEIGHT :: 720

main :: proc() {
	// Initialize window
	rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Main")
	defer rl.CloseWindow()

	// State
	x: i32 = 0
	y: i32 = 0

	// Main game loop
	for !rl.WindowShouldClose() {
		// Update logic
		if (rl.IsKeyDown(rl.KeyboardKey.UP)) {
			y -= 1
		}
		if (rl.IsKeyDown(rl.KeyboardKey.DOWN)) {
			y += 1
		}
		if (rl.IsKeyDown(rl.KeyboardKey.LEFT)) {
			x -= 1
		}
		if (rl.IsKeyDown(rl.KeyboardKey.RIGHT)) {
			x += 1
		}

		// Draw logic
		rl.BeginDrawing()
		rl.ClearBackground(rl.SKYBLUE)
		rl.DrawRectangle(x, y, 64, 64, rl.BLACK)
		rl.EndDrawing()
	}
}
