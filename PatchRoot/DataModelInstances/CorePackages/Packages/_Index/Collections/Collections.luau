-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:54 2026 Pacific Standard Time.

local parent = script.Parent
local arrayModule = require(script.Array)
local mapModule = require(script.Map)
local _ = require(parent.ES7Types)

return {
	Array = arrayModule,
	Object = require(script.Object),
	Map = mapModule.Map,
	coerceToMap = mapModule.coerceToMap,
	coerceToTable = mapModule.coerceToTable,
	Set = require(script.Set),
	WeakMap = require(script.WeakMap),
	inspect = require(script.inspect)
}