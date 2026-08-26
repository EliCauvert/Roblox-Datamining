local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local parent = script.Parent.Parent
local constantsModule = require(parent.Resources.Constants)
local globalConfigModule = require(parent.GlobalConfig)
local closeMenuModule = require(parent.Thunks.CloseMenu)
local vector2 = Vector2.new(0, 0)
local var1 = t.strictInterface({
	currentPage = t.string,
	open = t.boolean,
	onActivated = t.callback,
	occupiedWidth = t.number,
	screenSize = t.Vector2
})

return roactRodux.UNSTABLE_connect2(function(p1, _)
	return {
		occupiedWidth = 464,
		currentPage = p1.menuPage,
		open = p1.isMenuOpen,
		screenSize = p1.screenSize
	}
end, function(p1)
	-- upvalues: closeMenuModule (ref)
	return {
		onActivated = function()
			-- upvalues: p1 (ref), closeMenuModule (copy)
			p1(closeMenuModule)
		end
	}
end)(function(p1)
	-- upvalues: globalConfigModule (ref), var1 (ref), vector2 (ref), constantsModule (ref), withFoundationOrUIBloxStyle (ref), roact (ref)
	if globalConfigModule.propValidation then
		assert(var1(p1))
	end
	if p1.screenSize == vector2 then
		return nil
	end
	local var2 = p1.currentPage == constantsModule.InitalPageKey
	
	return withFoundationOrUIBloxStyle(function(p2)
		return {
			Theme = {
				Overlay = {
					Color = p2.Color.Common.Scrim.Color3,
					Transparency = p2.Color.Common.Scrim.Transparency
				}
			}
		}
	end, function(p2)
		-- upvalues: roact (copy), var2 (ref), p1 (ref)
		return roact.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 0,
			BackgroundColor3 = p2.Theme.Overlay.Color,
			BackgroundTransparency = p2.Theme.Overlay.Transparency,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = not var2 and p1.open
		}, {
			InputCapturer = roact.createElement("TextButton", {
				AnchorPoint = Vector2.new(1, 0),
				BackgroundTransparency = 1,
				Position = UDim2.new(1, 0, 0, 0),
				Size = UDim2.new(1, -p1.occupiedWidth, 1, 0),
				Text = "",
				[roact.Event.Activated] = p1.onActivated
			})
		})
	end)
end)