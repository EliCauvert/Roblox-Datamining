local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Resources.Constants)
local GlobalConfigModule = require(Parent.GlobalConfig)
local CloseMenuModule = require(Parent.Thunks.CloseMenu)
local _Vector2 = Vector2.new(0, 0)
local StrictInterfaceResult = T.strictInterface({
	currentPage = T.string,
	open = T.boolean,
	onActivated = T.callback,
	occupiedWidth = T.number,
	screenSize = T.Vector2
})

return InGameMenuDependenciesModule.RoactRodux.UNSTABLE_connect2(function(p1, _)
	return {
		occupiedWidth = 464,
		currentPage = p1.menuPage,
		open = p1.isMenuOpen,
		screenSize = p1.screenSize
	}
end, function(Callback)
	-- upvalues: CloseMenuModule (copy)
	return {
		onActivated = function()
			-- upvalues: Callback (copy), CloseMenuModule (upval)
			Callback(CloseMenuModule)
		end
	}
end)(function(p1)
	-- upvalues: GlobalConfigModule (copy), StrictInterfaceResult (copy), _Vector2 (copy), ConstantsModule (copy), WithFoundationOrUIBloxStyleFunction (copy), Roact (copy)
	if GlobalConfigModule.propValidation then
		assert(StrictInterfaceResult(p1))
	end
	if p1.screenSize == _Vector2 then
		return nil
	else
		local IsCurrentPageMatch = p1.currentPage == ConstantsModule.InitalPageKey
		
		return WithFoundationOrUIBloxStyleFunction(function(p2)
			return {
				Theme = {
					Overlay = {
						Color = p2.Color.Common.Scrim.Color3,
						Transparency = p2.Color.Common.Scrim.Transparency
					}
				}
			}
		end, function(p2)
			-- upvalues: Roact (upval), IsCurrentPageMatch (copy), p1 (copy)
			return Roact.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 0,
				BackgroundColor3 = p2.Theme.Overlay.Color,
				BackgroundTransparency = p2.Theme.Overlay.Transparency,
				Size = UDim2.new(1, 0, 1, 0),
				Visible = not IsCurrentPageMatch and p1.open
			}, {
				InputCapturer = Roact.createElement("TextButton", {
					AnchorPoint = Vector2.new(1, 0),
					BackgroundTransparency = 1,
					Position = UDim2.new(1, 0, 0, 0),
					Size = UDim2.new(1, -p1.occupiedWidth, 1, 0),
					Text = "",
					[Roact.Event.Activated] = p1.onActivated
				})
			})
		end)
	end
end)