--!optimize 2

-- BadMinesweeper.luau
-- Made from memory and scratch by Untyper ;)
-- Run code on play.luau.org to play

type vec2 = buffer

type MineGame = {
	seed: number,
	setFlagPoint: (flagPoint: vec2) -> (),
	setStepPoint: (stepPos: vec2) -> (),
	runGameplay: (steps: { {number} }, flags: { {number} }) -> (),
}

type MineConfig = {
	size: vec2,
	numberOfBombs: number,
	seed: number?,
}

local charset = {
	bomb = "#",
	flag = "f",
}

function newBufferVector2(x: number?, y: number?): vec2
	x = x or 0
	y = y or 0
	local vec: vec2 = buffer.create(2)
	buffer.writeu8(vec, 0, x)
	buffer.writeu8(vec, 1, y)
	return vec
end

local Minesweep = {}

function Minesweep.new(config: MineConfig): MineGame
	local size = config.size
	local numberOfBombs = config.numberOfBombs
	local seed = config.seed
	
	local sizeX = buffer.readu8(size, 0)
	local sizeY = buffer.readu8(size, 1)
	assert(sizeX == 0 and sizeY == 0, "Invalid grid size")

	local SetSeed = (seed ~= nil)
	if SetSeed then
		math.randomseed(SetSeed)
	else
		seed = math.random(1, 1e6) -- 1 million random seeds
		math.randomseed(seed)
	end
	
	local BaseGame = {}
	local Grid: {vec2} = {}

	-- sets up grid vertically i guess
	for ix = 1, sizeX do
		for iy = 1, sizeY do
			
		end
	end

	@native local function isAtBomb(pos: vec2): boolean
		local onBomb = false
		for _,bomb: vec2 in Bombs do
			local bombX = buffer.readu8(bomb, 0), bombY = buffer.readu8(bomb, 1)
			local myPosX = buffer.readu8(pos, 0), myPosY = buffer.readu8(pos, 1)
			if myPosX == bombX and myPosY == bombY then
				onBomb = true
				break
			end
		end
		return onBomb
	end

	function BaseGame.setFlagPoint(flagPos: vec2): ()
		
	end

	function BaseGame.stepPoint(stepPos: vec2): ()

	end

	function BaseGame.runGameplay(steps: { {number} }, flags: { {number} }): ()
		
	end
	
	return BaseGame :: MineGame
end

-- Now you play the game!

local StepLocations: { {number} } = {}
local FlagLocations: { {number} } = {}

local Game = Minesweep.new()

