local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local FFlagUseStandardFoundationButtonVariantModule = require(Modules.LuaApp.Flags.FFlagUseStandardFoundationButtonVariant)

return function(p1)
	-- upvalues: ArgCheckModule (copy), WithLocalizationModule (copy), RoactModule (copy), Button (copy), FFlagUseStandardFoundationButtonVariantModule (copy), ButtonVariant (copy), ButtonSize (copy)
	local OnActivated = p1.onActivated
	ArgCheckModule.isType(OnActivated, "function", "onActivated")
	
	return WithLocalizationModule({ logOutText = "Application.Logout.Action.Logout" })(function(p2)
		-- upvalues: RoactModule (upval), Button (upval), FFlagUseStandardFoundationButtonVariantModule (upval), ButtonVariant (upval), ButtonSize (upval), OnActivated (copy)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			UIPadding = RoactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 24),
				PaddingRight = UDim.new(0, 24)
			}),
			UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(688, 1e999) }),
			LogOutButtonFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				LogOutButton = RoactModule.createElement(Button, {
					isLoading = false,
					isDisabled = false,
					variant = if FFlagUseStandardFoundationButtonVariantModule then ButtonVariant.Standard else ButtonVariant.Subtle,
					size = ButtonSize.Large,
					text = p2.logOutText,
					onActivated = OnActivated,
					width = UDim.new(1, 0)
				})
			})
		})
	end)
end