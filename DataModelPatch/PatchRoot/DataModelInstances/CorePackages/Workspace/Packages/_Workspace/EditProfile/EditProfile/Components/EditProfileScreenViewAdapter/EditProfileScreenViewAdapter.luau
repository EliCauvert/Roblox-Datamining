local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local _ = require(EditProfile.Common.Enums)
local CryoModule = require(Parent.Cryo)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local GetDisplayStoreFunction = require(Parent.Display).GetDisplayStore
local UseEditProfileScreenConfigModule = require(EditProfile.Hooks.useEditProfileScreenConfig)
local EditProfileModalModule = require(EditProfile.BaseComponents.EditProfileModal)
local EditProfileScreenModule = require(EditProfile.BaseComponents.EditProfileScreen)
local FocusNavigatorWrapperModule = require(EditProfile.Utils.FocusNavigatorWrapper)
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab

return function(p1)
	-- upvalues: UseEditProfileScreenConfigModule (copy), GetDisplayStoreFunction (copy), UseTokensFunction (copy), ReactModule (copy), FFlagAXEnableProfileTab (copy), CryoModule (copy), EditProfileScreenModule (copy), EditProfileModalModule (copy), FocusNavigatorWrapperModule (copy)
	local UseEditProfileScreenConfigModuleResult = UseEditProfileScreenConfigModule(p1.navigation.state.params.screen)
	local DisplayStore = GetDisplayStoreFunction(false)
	local UseTokensResult = UseTokensFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		if UseRefResult.current and UseRefResult.current.focus and not UseRefResult1.current then
			UseRefResult1.current = true
			UseRefResult.current.focus()
		end
	end, { UseRefResult.current })
	local IsFullBleed: boolean = FFlagAXEnableProfileTab and p1.navigation.state.params.fullBleed == true
	local JoinResult = CryoModule.Dictionary.join(UseEditProfileScreenConfigModuleResult, {
		component = ReactModule.useMemo(function()
			-- upvalues: UseEditProfileScreenConfigModuleResult (copy), UseRefResult (copy), ReactModule (upval)
			local config = {
				registerSaveHandler = UseEditProfileScreenConfigModuleResult.registerSaveHandler,
				textBoxRef = UseRefResult
			}
			
			if UseEditProfileScreenConfigModuleResult.updateErrorState then
				config.updateErrorState = UseEditProfileScreenConfigModuleResult.updateErrorState
			end
			return (ReactModule.createElement(UseEditProfileScreenConfigModuleResult.component, config))
		end, {
			UseEditProfileScreenConfigModuleResult.component,
			UseEditProfileScreenConfigModuleResult.registerSaveHandler,
			UseRefResult
		}),
		isDisabled = UseEditProfileScreenConfigModuleResult.hasError == true,
		fullBleed = IsFullBleed
	})
	local IsDisplaySizeMatch = DisplayStore.getDisplaySize(false) == Enum.DisplaySize.Small
	local Element = if IsDisplaySizeMatch or IsFullBleed then ReactModule.createElement(EditProfileScreenModule, JoinResult) else ReactModule.createElement(EditProfileModalModule, JoinResult)
	
	return if IsFullBleed then FocusNavigatorWrapperModule({ onClose = UseEditProfileScreenConfigModuleResult.onClose }, { Content = Element }) else FocusNavigatorWrapperModule({ onClose = UseEditProfileScreenConfigModuleResult.onClose }, {
		ReactModule.createElement("ImageButton", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = UseTokensResult.Color.Common.Scrim.Transparency,
			BackgroundColor3 = UseTokensResult.Color.Common.Scrim.Color3,
			Active = true,
			AutoButtonColor = false,
			[ReactModule.Event.Activated] = if IsDisplaySizeMatch then nil else UseEditProfileScreenConfigModuleResult.onClose
		}, { Content = Element })
	})
end