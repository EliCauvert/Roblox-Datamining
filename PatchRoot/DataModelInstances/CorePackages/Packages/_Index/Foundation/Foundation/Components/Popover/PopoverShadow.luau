-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:07 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local constantsModule = require(foundation.Constants)
local imageModule = require(foundation.Components.Image)
local _ = require(foundation.Components.Types)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local SHADOW_IMAGE = constantsModule.SHADOW_IMAGE
local SHADOW_SIZE = constantsModule.SHADOW_SIZE

return function(p0) --[[ line: 22 | named "PopoverShadow" ]]
	-- upvalues: useTokensModule (ref), reactModule (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref)
	return reactModule.createElement(imageModule, {
		AnchorPoint = p0.AnchorPoint,
		Image = SHADOW_IMAGE,
		Size = p0.contentSize:map(function(p1) --[[ line: 28 ]]
			-- upvalues: SHADOW_SIZE (copy)
			return p1 + UDim2.fromOffset(SHADOW_SIZE, SHADOW_SIZE)
		end),
		Position = p0.position,
		ZIndex = p0.ZIndex,
		slice = {
			center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
		},
		imageStyle = useTokensModule().Color.Extended.Black.Black_20,
		testId = p0.testId
	})
end