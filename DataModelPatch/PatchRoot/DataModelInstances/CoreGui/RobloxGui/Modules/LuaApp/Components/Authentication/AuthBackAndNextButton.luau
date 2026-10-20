local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local FFlagUseStandardFoundationButtonVariantModule = require(Modules.LuaApp.Flags.FFlagUseStandardFoundationButtonVariant)
local AuthBackAndContinueButton = RoactModule.PureComponent:extend("AuthBackAndContinueButton")
AuthBackAndContinueButton.defaultProps = { size = UDim2.new(1, 0, 0, 36) }

function AuthBackAndContinueButton.init(p1)
	function p1.backButtonOnActivated()
		-- upvalues: p1 (copy)
		local NavigateBackFunction: () -> () = p1.props.navigateBack
		local BackButtonIsLoading = p1.props.backButtonIsLoading
		
		if not p1.props.backButtonIsDisabled and not BackButtonIsLoading then
			NavigateBackFunction()
		end
	end
end

function AuthBackAndContinueButton.render(p1)
	-- upvalues: WithLocalizationModule (copy), RoactModule (copy), Button (copy), FFlagUseStandardFoundationButtonVariantModule (copy), ButtonVariant (copy), ButtonSize (copy)
	local Size = p1.props.size
	local Position = p1.props.position
	local AnchorPoint = p1.props.anchorPoint
	local LayoutOrder = p1.props.layoutOrder
	local BackButtonIsDisabled = p1.props.backButtonIsDisabled
	local BackButtonIsLoading = p1.props.backButtonIsLoading
	local NextButtonText = p1.props.nextButtonText
	local NextButtonIsDisabled = p1.props.nextButtonIsDisabled
	local NextButtonIsLoading = p1.props.nextButtonIsLoading
	local NextButtonOnActivated = p1.props.nextButtonOnActivated
	
	return WithLocalizationModule({ backButtonText = "CommonUI.Controls.Action.Back" })(function(p2)
		-- upvalues: RoactModule (upval), Size (copy), Position (copy), AnchorPoint (copy), LayoutOrder (copy), Button (upval), FFlagUseStandardFoundationButtonVariantModule (upval), ButtonVariant (upval), ButtonSize (upval), BackButtonIsDisabled (copy), BackButtonIsLoading (copy), p1 (copy), NextButtonText (copy), NextButtonIsDisabled (copy), NextButtonIsLoading (copy), NextButtonOnActivated (copy)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = Size,
			Position = Position,
			AnchorPoint = AnchorPoint,
			LayoutOrder = LayoutOrder
		}, {
			BackButton = RoactModule.createElement(Button, {
				variant = if FFlagUseStandardFoundationButtonVariantModule then ButtonVariant.Standard else ButtonVariant.Subtle,
				size = ButtonSize.Medium,
				text = p2.backButtonText,
				isDisabled = BackButtonIsDisabled,
				isLoading = BackButtonIsLoading,
				onActivated = p1.backButtonOnActivated,
				width = UDim.new(0.5, -6)
			}),
			NextButton = RoactModule.createElement(Button, {
				variant = ButtonVariant.SubEmphasis,
				size = ButtonSize.Medium,
				text = NextButtonText,
				isDisabled = NextButtonIsDisabled,
				isLoading = NextButtonIsLoading,
				onActivated = NextButtonOnActivated,
				width = UDim.new(0.5, -6),
				Position = UDim2.new(1, 0, 0, 0),
				AnchorPoint = Vector2.new(1, 0)
			})
		})
	end)
end

return (RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackModule (copy)
	return {
		navigateBack = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.back() else Callback(NavigateBackModule())
		end
	}
end)(AuthBackAndContinueButton))