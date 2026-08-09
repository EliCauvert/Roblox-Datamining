local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local withStyle = inGameMenuDependenciesModule.UIBlox.Core.Style.withStyle
local parent = script.Parent.Parent
local constantsModule = require(parent.Resources.Constants)
local globalConfigModule = require(parent.GlobalConfig)
local closeMenuModule = require(parent.Thunks.CloseMenu)
local vector2 = Vector2.new(0, 0)
local var5 = t.strictInterface({
	currentPage = t.string,
	open = t.boolean,
	onActivated = t.callback,
	occupiedWidth = t.number,
	screenSize = t.Vector2
})

return roactRodux.UNSTABLE_connect2(function(p2, _) --[[ line: 60 ]]
	return {
		occupiedWidth = 464,
		currentPage = p2.menuPage,
		open = p2.isMenuOpen,
		screenSize = p2.screenSize
	}
end, function(p3) --[[ line: 69 ]]
	-- upvalues: closeMenuModule (ref)
	return {
		onActivated = function() --[[ line: 71 ]]
			-- upvalues: p3 (ref), closeMenuModule (copy)
			p3(closeMenuModule)
		end
	}
end)(function(p0) --[[ line: 28 | named "ViewportOverlay" ]]
	-- upvalues: globalConfigModule (ref), var5 (ref), vector2 (ref), constantsModule (ref), withStyle (ref), roact (ref)
	if globalConfigModule.propValidation then
		assert(var5(p0))
	end
	if p0.screenSize == vector2 then
		return nil
	end
	local var6 = p0.currentPage == constantsModule.InitalPageKey
	
	return withStyle(function(p1) --[[ line: 39 ]]
		-- upvalues: roact (copy), var6 (ref), p0 (ref)
		return roact.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 0,
			BackgroundColor3 = p1.Theme.Overlay.Color,
			BackgroundTransparency = p1.Theme.Overlay.Transparency,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = not var6 and p0.open
		}, {
			InputCapturer = roact.createElement("TextButton", {
				AnchorPoint = Vector2.new(1, 0),
				BackgroundTransparency = 1,
				Position = UDim2.new(1, 0, 0, 0),
				Size = UDim2.new(1, -p0.occupiedWidth, 1, 0),
				Text = "",
				[roact.Event.Activated] = p0.onActivated
			})
		})
	end)
end)