local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local Parent = SduiSharedContent.Parent
local ReactModule = require(Parent.React)
local SendCoachmarkImpressionModule = require(SduiSharedContent.Analytics.sendCoachmarkImpression)
local LuaAppUseNavFocusInSduiCoachmark = game:DefineFastFlag("LuaAppUseNavFocusInSduiCoachmark", false)
local LuaAppCoachmarkImpression = game:DefineFastFlag("LuaAppCoachmarkImpression", false)
local LuaAppHideSduiCoachmarkWhenFlyoutOpen = game:DefineFastFlag("LuaAppHideSduiCoachmarkWhenFlyoutOpen", false)
local LuaAppHideSduiCoachmarkWhenCentralOverlayOpen = game:DefineFastFlag("LuaAppHideSduiCoachmarkWhenCentralOverlayOpen", false)
local LuaAppHideSduiCoachmarkWhenNotificationStreamOpen = game:DefineFastFlag("LuaAppHideSduiCoachmarkWhenNotificationStreamOpen", false)
local Coachmark = require(Parent.Foundation).Coachmark
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local UseDrawerVisibleFunction = require(Parent.Drawer).Hooks.useDrawerVisible
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local StreamNotificationStore = require(Parent.StreamNotifications).StreamNotificationStore
local CollectionService = game:GetService("CollectionService")

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), LuaAppUseNavFocusInSduiCoachmark (copy), UseNavigationFocusFunction (copy), LuaAppHideSduiCoachmarkWhenFlyoutOpen (copy), UseDrawerVisibleFunction (copy), LuaAppHideSduiCoachmarkWhenCentralOverlayOpen (copy), UseSelectorFunction (copy), LuaAppHideSduiCoachmarkWhenNotificationStreamOpen (copy), UseSignalStateFunction (copy), StreamNotificationStore (copy), CollectionService (copy), LuaAppCoachmarkImpression (copy), SendCoachmarkImpressionModule (copy), Coachmark (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseNavigationFocusResult = if LuaAppUseNavFocusInSduiCoachmark then UseNavigationFocusFunction() else nil
	local UseDrawerVisibleResult = if LuaAppHideSduiCoachmarkWhenFlyoutOpen then UseDrawerVisibleFunction() else false
	local UseSelectorResult = if LuaAppHideSduiCoachmarkWhenCentralOverlayOpen then UseSelectorFunction(function(p2): boolean
		return p2.CentralOverlay.OverlayType ~= nil
	end) else nil
	local UseSignalStateResult = if LuaAppHideSduiCoachmarkWhenNotificationStreamOpen then UseSignalStateFunction(StreamNotificationStore.getStreamPresented) else nil
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy), CollectionService (upval), p1 (copy)
		local function onTagAdded(Tagged)
			-- upvalues: UseRefResult (upval), UseStateResult2_1 (upval)
			if Tagged:IsA("GuiObject") then
				UseRefResult.current = Tagged
				UseStateResult2_1(true)
				
				return
			end
		end
		
		local function onTagRemoved(_)
			-- upvalues: UseRefResult (upval), UseStateResult2_1 (upval)
			UseRefResult.current = nil
			UseStateResult2_1(false)
		end
		
		for _, Gui in CollectionService:GetTagged(p1.collectionServiceAnchorTag) do
			if Gui:IsA("GuiObject") then
				if not Gui:IsA("GuiObject") then break end
				UseRefResult.current = Gui
				UseStateResult2_1(true)
				break
			else
				continue
			end
		end
		local Connection = CollectionService:GetInstanceAddedSignal(p1.collectionServiceAnchorTag):Connect(onTagAdded)
		local Connection1 = CollectionService:GetInstanceRemovedSignal(p1.collectionServiceAnchorTag):Connect(onTagRemoved)
		
		return function()
			-- upvalues: Connection (copy), Connection1 (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
		end
	end, { p1.collectionServiceAnchorTag })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(true)
		
		if p1.onClose then
			p1.onClose()
		end
	end, { p1.onClose })
	
	if LuaAppCoachmarkImpression then
		local UseRefResult1 = ReactModule.useRef(false)
		local Inverted: boolean = UseStateResult1 and (not UseStateResult and (not (LuaAppUseNavFocusInSduiCoachmark and not UseNavigationFocusResult) and (not (LuaAppHideSduiCoachmarkWhenFlyoutOpen and UseDrawerVisibleResult) and (not (LuaAppHideSduiCoachmarkWhenCentralOverlayOpen and UseSelectorResult) and not (LuaAppHideSduiCoachmarkWhenNotificationStreamOpen and UseSignalStateResult)))))
		ReactModule.useEffect(function()
			-- upvalues: Inverted (copy), UseRefResult1 (copy), p1 (copy), SendCoachmarkImpressionModule (upval)
			if Inverted and not UseRefResult1.current then
				local Media = p1.media
				SendCoachmarkImpressionModule(p1.collectionServiceAnchorTag, (typeof(Media) ~= "table" or next(Media) ~= nil) and Media ~= nil)
				UseRefResult1.current = true
				
				return
			end
		end, { Inverted, p1.collectionServiceAnchorTag, p1.media })
		
		if not Inverted then
			return nil
		end
	elseif not UseStateResult1 or UseStateResult or LuaAppUseNavFocusInSduiCoachmark and not UseNavigationFocusResult or LuaAppHideSduiCoachmarkWhenFlyoutOpen and UseDrawerVisibleResult or LuaAppHideSduiCoachmarkWhenCentralOverlayOpen and UseSelectorResult or LuaAppHideSduiCoachmarkWhenNotificationStreamOpen and UseSignalStateResult then
		return nil
	end
	return ReactModule.createElement(Coachmark, {
		title = p1.title,
		text = p1.body,
		isOpen = if LuaAppUseNavFocusInSduiCoachmark then true else UseStateResult1 and not UseStateResult,
		side = p1.side,
		align = p1.align,
		anchorRef = UseRefResult,
		onClose = UseResult,
		actions = p1.actions,
		media = p1.media,
		testId = p1.testId
	})
end)