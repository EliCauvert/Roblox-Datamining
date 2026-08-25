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
local var6 = t.strictInterface({
	currentPage = t.string,
	open = t.boolean,
	onActivated = t.callback,
	occupiedWidth = t.number,
	screenSize = t.Vector2
})

return roactRodux.UNSTABLE_connect2(function(p3, _)
	return {
		occupiedWidth = 464,
		currentPage = p3.menuPage,
		open = p3.isMenuOpen,
		screenSize = p3.screenSize
	}
end, function(p4)
	-- upvalues: closeMenuModule (ref)
	return {
		onActivated = function()
			-- upvalues: p4 (ref), closeMenuModule (copy)
			p4(closeMenuModule)
		end
	}
end)(function(p0)
	-- upvalues: globalConfigModule (ref), var6 (ref), vector2 (ref), constantsModule (ref), withFoundationOrUIBloxStyle (ref), roact (ref)
	if globalConfigModule.propValidation then
		assert(var6(p0))
	end
	if p0.screenSize == vector2 then
		return nil
	end
	local var7 = p0.currentPage == constantsModule.InitalPageKey
	
	return withFoundationOrUIBloxStyle(function(p1)
		return {
			Theme = {
				Overlay = {
					Color = p1.Color.Common.Scrim.Color3,
					Transparency = p1.Color.Common.Scrim.Transparency
				}
			}
		}
	end, function(p2)
		-- upvalues: roact (copy), var7 (ref), p0 (ref)
		return roact.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 0,
			BackgroundColor3 = p2.Theme.Overlay.Color,
			BackgroundTransparency = p2.Theme.Overlay.Transparency,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = not var7 and p0.open
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