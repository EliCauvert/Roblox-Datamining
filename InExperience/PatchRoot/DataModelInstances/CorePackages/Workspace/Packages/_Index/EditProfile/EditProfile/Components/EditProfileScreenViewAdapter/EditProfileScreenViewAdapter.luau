local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local displayModule = require(parent.Display)
local _ = require(editProfile.Common.Enums)
local cryoModule = require(parent.Cryo)
local useTokens = require(parent.Foundation).Hooks.useTokens
local getDisplayStore = displayModule.GetDisplayStore
local useEditProfileScreenConfigModule = require(editProfile.Hooks.useEditProfileScreenConfig)
local editProfileModalModule = require(editProfile.BaseComponents.EditProfileModal)
local editProfileScreenModule = require(editProfile.BaseComponents.EditProfileScreen)
local focusNavigatorWrapperModule = require(editProfile.Utils.FocusNavigatorWrapper)
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab

return function(p0) --[[ line: 29 ]]
	-- upvalues: useEditProfileScreenConfigModule (ref), getDisplayStore (ref), useTokens (ref), reactModule (ref), fFlagAXEnableProfileTab (ref), cryoModule (ref), editProfileScreenModule (ref), editProfileModalModule (ref), focusNavigatorWrapperModule (ref)
	local var8 = useEditProfileScreenConfigModule(p0.navigation.state.params.screen)
	local var9 = getDisplayStore(false)
	local var10 = useTokens()
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 38 ]]
		-- upvalues: var11 (ref), var12 (ref)
		if var11.current and var11.current.focus and not var12.current then
			var12.current = true
			var11.current.focus()
		end
	end, { var11.current })
	local var13 = fFlagAXEnableProfileTab and p0.navigation.state.params.fullBleed == true
	local var14 = cryoModule.Dictionary.join(var8, {
		component = reactModule.useMemo(function() --[[ line: 45 ]]
			-- upvalues: var8 (ref), var11 (ref), reactModule (copy)
			local t = {
				registerSaveHandler = var8.registerSaveHandler,
				textBoxRef = var11
			}
			
			if var8.updateErrorState then
				t.updateErrorState = var8.updateErrorState
			end
			return reactModule.createElement(var8.component, t)
		end, { var8.component, var8.registerSaveHandler, var11 }),
		isDisabled = var8.hasError == true,
		fullBleed = var13
	})
	local var15 = var9.getDisplaySize(false) == Enum.DisplaySize.Small
	local _ = nil
	local var16 = if var15 or var13 then reactModule.createElement(editProfileScreenModule, var14) else reactModule.createElement(editProfileModalModule, var14)
	
	return if var13 then focusNavigatorWrapperModule({ onClose = var8.onClose }, { Content = var16 }) else focusNavigatorWrapperModule({ onClose = var8.onClose }, {
		reactModule.createElement("ImageButton", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = var10.Color.Common.Scrim.Transparency,
			BackgroundColor3 = var10.Color.Common.Scrim.Color3,
			Active = true,
			AutoButtonColor = false,
			[reactModule.Event.Activated] = if not var15 then var8.onClose else nil
		}, { Content = var16 })
	})
end