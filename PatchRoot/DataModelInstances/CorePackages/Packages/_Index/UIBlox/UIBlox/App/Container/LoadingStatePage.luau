-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:52 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent.Parent
local roactModule = require(parent.Roact)
local foundationModule = require(parent.Foundation)
local loading = foundationModule.Loading
local iconSize = foundationModule.Enums.IconSize
local loadingStatePage = roactModule.PureComponent:extend("LoadingStatePage")

function loadingStatePage.render(_) --[[ line: 13 ]]
	-- upvalues: roactModule (ref), loading (ref), iconSize (ref)
	return roactModule.createElement(loading, {
		size = iconSize.Medium,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end

return loadingStatePage