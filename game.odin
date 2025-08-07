package main

import rl "vendor:raylib"

SCREEN_WIDTH :: 1280
SCREEN_HEIGHT :: 720

Player :: struct {
    x: i32,
    y: i32,
}

move :: proc(player: ^Player) {
    if (rl.IsKeyDown(rl.KeyboardKey.UP)) { player.y -= 5 }
	if (rl.IsKeyDown(rl.KeyboardKey.DOWN)) { player.y += 5 }
	if (rl.IsKeyDown(rl.KeyboardKey.LEFT)) { player.x -= 5 }
	if (rl.IsKeyDown(rl.KeyboardKey.RIGHT)) { player.x += 5 }
}

main :: proc() {
	// Initialize window
	rl.SetConfigFlags({.MSAA_4X_HINT})
	rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Game")
	rl.SetTargetFPS(60)
	defer rl.CloseWindow()

	// Main game loop
	player := Player{SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2}
	for !rl.WindowShouldClose() {
		move(&player)
		rl.BeginDrawing()
		rl.ClearBackground(rl.SKYBLUE)
		rl.DrawRectangle(player.x, player.y, 96, 96, rl.WHITE)
		rl.EndDrawing()
	}
}
