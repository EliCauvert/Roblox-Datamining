-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:40 2026 Pacific Standard Time.

local parent = script:FindFirstAncestor("Components").Parent.Parent
local inlineLayoutElements = script:FindFirstAncestor("InlineLayoutElements")
local foundationModule = require(parent.Foundation)
local dashModule = require(parent.Dash)
local renderableInlineElementModule = require(inlineLayoutElements.RenderableInlineElement)
local image = foundationModule.Image
local t = {}

local function mapProps(p0) --[[ line: 13 ]]
	-- upvalues: dashModule (ref)
	return dashModule.omit(p0, { "id" })
end

function t.new(p1) --[[ line: 17 ]]
	-- upvalues: renderableInlineElementModule (ref), image (ref), mapProps (ref)
	return renderableInlineElementModule.new(image, p1, mapProps)
end

return t