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

return function(p1)
	-- upvalues: useEditProfileScreenConfigModule (ref), getDisplayStore (ref), useTokens (ref), reactModule (ref), fFlagAXEnableProfileTab (ref), cryoModule (ref), editProfileScreenModule (ref), editProfileModalModule (ref), focusNavigatorWrapperModule (ref)
	local var1 = useEditProfileScreenConfigModule(p1.navigation.state.params.screen)
	local var2 = getDisplayStore(false)
	local var3 = useTokens()
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var5 (ref)
		if var4.current and var4.current.focus and not var5.current then
			var5.current = true
			var4.current.focus()
		end
	end, { var4.current })
	local var6 = fFlagAXEnableProfileTab and p1.navigation.state.params.fullBleed == true
	local var7 = cryoModule.Dictionary.join(var1, {
		component = reactModule.useMemo(function()
			-- upvalues: var1 (ref), var4 (ref), reactModule (copy)
			local t = {
				registerSaveHandler = var1.registerSaveHandler,
				textBoxRef = var4
			}
			
			if var1.updateErrorState then
				t.updateErrorState = var1.updateErrorState
			end
			return reactModule.createElement(var1.component, t)
		end, { var1.component, var1.registerSaveHandler, var4 }),
		isDisabled = var1.hasError == true,
		fullBleed = var6
	})
	local var8 = var2.getDisplaySize(false) == Enum.DisplaySize.Small
	local _ = nil
	local var9 = if var8 or var6 then reactModule.createElement(editProfileScreenModule, var7) else reactModule.createElement(editProfileModalModule, var7)
	
	return if var6 then focusNavigatorWrapperModule({ onClose = var1.onClose }, { Content = var9 }) else focusNavigatorWrapperModule({ onClose = var1.onClose }, {
		reactModule.createElement("ImageButton", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = var3.Color.Common.Scrim.Transparency,
			BackgroundColor3 = var3.Color.Common.Scrim.Color3,
			Active = true,
			AutoButtonColor = false,
			[reactModule.Event.Activated] = if not var8 then var1.onClose else nil
		}, { Content = var9 })
	})
end