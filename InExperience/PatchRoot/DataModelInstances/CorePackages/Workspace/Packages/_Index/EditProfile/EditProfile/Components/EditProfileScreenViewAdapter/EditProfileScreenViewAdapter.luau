local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local _ = require(EditProfile.Common.Enums)
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GetDisplayStoreFunction = require(Parent.Display).GetDisplayStore
local UseEditProfileScreenConfigModule = require(EditProfile.Hooks.useEditProfileScreenConfig)
local EditProfileModalModule = require(EditProfile.BaseComponents.EditProfileModal)
local EditProfileScreenModule = require(EditProfile.BaseComponents.EditProfileScreen)
local FocusNavigatorWrapperModule = require(EditProfile.Utils.FocusNavigatorWrapper)
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab
local FFlagSplitPaneFullBleedEditProfile = require(Parent.SharedFlags).FFlagSplitPaneFullBleedEditProfile

local function EditorSlot(p1)
	-- upvalues: ReactModule (copy), View (copy)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useLayoutEffect(function()
		-- upvalues: p1 (copy), UseRefResult (copy)
		local Host = p1.host
		Host.Parent = UseRefResult.current
		
		return function()
			-- upvalues: Host (copy)
			Host.Parent = nil
		end
	end, { p1.host })
	
	return ReactModule.createElement(View, { tag = "size-full-0 auto-y", ref = UseRefResult })
end

local function createEditorHost()
	local EditorHost = Instance.new("Frame")
	EditorHost.Name = "EditorHost"
	EditorHost.BackgroundTransparency = 1
	EditorHost.BorderSizePixel = 0
	EditorHost.Size = UDim2.fromScale(1, 0)
	EditorHost.AutomaticSize = Enum.AutomaticSize.Y
	
	return EditorHost
end

return function(p1)
	-- upvalues: UseEditProfileScreenConfigModule (copy), GetDisplayStoreFunction (copy), UseTokensFunction (copy), ReactModule (copy), FFlagAXEnableProfileTab (copy), FFlagSplitPaneFullBleedEditProfile (copy), Parent (copy), createEditorHost (copy), EditorSlot (copy), ReactRobloxModule (copy), CryoModule (copy), EditProfileScreenModule (copy), EditProfileModalModule (copy), FocusNavigatorWrapperModule (copy)
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
	local UseMemoResult = ReactModule.useMemo(function()
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
	})
	local IsFullBleed: boolean = FFlagAXEnableProfileTab and p1.navigation.state.params.fullBleed == true
	local Element = UseMemoResult
	local Portal = nil
	
	if FFlagSplitPaneFullBleedEditProfile then
		local UseContextResult = ReactModule.useContext(require(Parent.SplitPane).PaneHostContext)
		
		if UseContextResult ~= nil then
			IsFullBleed = not UseContextResult.isFullScreen
		end
		local UseMemoResult1 = ReactModule.useMemo(createEditorHost, {})
		ReactModule.useEffect(function()
			-- upvalues: UseMemoResult1 (copy)
			return function()
				-- upvalues: UseMemoResult1 (upval)
				UseMemoResult1:Destroy()
			end
		end, { UseMemoResult1 })
		Element = ReactModule.createElement(EditorSlot, { host = UseMemoResult1 })
		Portal = ReactRobloxModule.createPortal(UseMemoResult, UseMemoResult1)
	end
	local JoinResult = CryoModule.Dictionary.join(UseEditProfileScreenConfigModuleResult, {
		component = if FFlagSplitPaneFullBleedEditProfile then Element else UseMemoResult,
		isDisabled = UseEditProfileScreenConfigModuleResult.hasError == true,
		fullBleed = IsFullBleed
	})
	local IsDisplaySizeMatch = DisplayStore.getDisplaySize(false) == Enum.DisplaySize.Small
	local Element1 = if IsDisplaySizeMatch or IsFullBleed then ReactModule.createElement(EditProfileScreenModule, JoinResult) else ReactModule.createElement(EditProfileModalModule, JoinResult)
	
	return if IsFullBleed then FocusNavigatorWrapperModule({ onClose = UseEditProfileScreenConfigModuleResult.onClose }, {
		Content = Element1,
		Editor = if FFlagSplitPaneFullBleedEditProfile then Portal else nil
	}) else FocusNavigatorWrapperModule({ onClose = UseEditProfileScreenConfigModuleResult.onClose }, {
		ReactModule.createElement("ImageButton", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = UseTokensResult.Color.Common.Scrim.Transparency,
			BackgroundColor3 = UseTokensResult.Color.Common.Scrim.Color3,
			Active = true,
			AutoButtonColor = false,
			[ReactModule.Event.Activated] = if IsDisplaySizeMatch then nil else UseEditProfileScreenConfigModuleResult.onClose
		}, { Content = Element1 }),
		Editor = if FFlagSplitPaneFullBleedEditProfile then Portal else nil
	})
end