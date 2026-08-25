local sduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local parent = sduiSharedContent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local navigationModule = require(parent.Navigation)
local drawerModule = require(parent.Drawer)
local roactUtilsModule = require(parent.RoactUtils)
local signalsReactModule = require(parent.SignalsReact)
local streamNotificationsModule = require(parent.StreamNotifications)
local sendCoachmarkImpressionModule = require(sduiSharedContent.Analytics.sendCoachmarkImpression)
local luaAppUseNavFocusInSduiCoachmark = game:DefineFastFlag("LuaAppUseNavFocusInSduiCoachmark", false)
local luaAppCoachmarkImpression = game:DefineFastFlag("LuaAppCoachmarkImpression", false)
local luaAppHideSduiCoachmarkWhenFlyoutOpen = game:DefineFastFlag("LuaAppHideSduiCoachmarkWhenFlyoutOpen", false)
local luaAppHideSduiCoachmarkWhenCentralOverlayOpen = game:DefineFastFlag("LuaAppHideSduiCoachmarkWhenCentralOverlayOpen", false)
local luaAppHideSduiCoachmarkWhenNotificationStreamOpen = game:DefineFastFlag("LuaAppHideSduiCoachmarkWhenNotificationStreamOpen", false)
local coachmark = foundationModule.Coachmark
local useNavigationFocus = navigationModule.useNavigationFocus
local useDrawerVisible = drawerModule.Hooks.useDrawerVisible
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useSignalState = signalsReactModule.useSignalState
local streamNotificationStore = streamNotificationsModule.StreamNotificationStore
local collectionService = game:GetService("CollectionService")

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), luaAppUseNavFocusInSduiCoachmark (ref), useNavigationFocus (ref), luaAppHideSduiCoachmarkWhenFlyoutOpen (ref), useDrawerVisible (ref), luaAppHideSduiCoachmarkWhenCentralOverlayOpen (ref), useSelector (ref), luaAppHideSduiCoachmarkWhenNotificationStreamOpen (ref), useSignalState (ref), streamNotificationStore (ref), collectionService (ref), luaAppCoachmarkImpression (ref), sendCoachmarkImpressionModule (ref), coachmark (ref)
	local var15 = reactModule.useRef(nil)
	local var16, var17 = reactModule.useState(false)
	local var18, var19 = reactModule.useState(false)
	local var20 = if luaAppUseNavFocusInSduiCoachmark then useNavigationFocus() else nil
	local var21 = if luaAppHideSduiCoachmarkWhenFlyoutOpen then useDrawerVisible() else false
	local var22 = if luaAppHideSduiCoachmarkWhenCentralOverlayOpen then useSelector(function(p1)
		return p1.CentralOverlay.OverlayType ~= nil
	end) else nil
	local var23 = if luaAppHideSduiCoachmarkWhenNotificationStreamOpen then useSignalState(streamNotificationStore.getStreamPresented) else nil
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), var19 (ref), collectionService (copy), p0 (ref)
		local function onTagAdded(p2)
			-- upvalues: var15 (copy), var19 (copy)
			if p2:IsA("GuiObject") then
				var15.current = p2
				var19(true)
				
				return
			end
		end
		
		local function onTagRemoved(_)
			-- upvalues: var15 (copy), var19 (copy)
			var15.current = nil
			var19(false)
		end
		
		for i, v in collectionService:GetTagged(p0.collectionServiceAnchorTag) do
			if v:IsA("GuiObject") then
				if not v:IsA("GuiObject") then break end
				var15.current = v
				var19(true)
				break
			end
		end
		local var29 = collectionService:GetInstanceAddedSignal(p0.collectionServiceAnchorTag):Connect(onTagAdded)
		local var30 = collectionService:GetInstanceRemovedSignal(p0.collectionServiceAnchorTag):Connect(onTagRemoved)
		
		return function()
			-- upvalues: var29 (ref), var30 (ref)
			var29:Disconnect()
			var30:Disconnect()
		end
	end, { p0.collectionServiceAnchorTag })
	local var24 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), p0 (ref)
		var17(true)
		
		if p0.onClose then
			p0.onClose()
		end
	end, { p0.onClose })
	
	if luaAppCoachmarkImpression then
		local var25 = reactModule.useRef(false)
		local var26 = var18 and (not var16 and (not (luaAppUseNavFocusInSduiCoachmark and not var20) and (not (luaAppHideSduiCoachmarkWhenFlyoutOpen and var21) and (not (luaAppHideSduiCoachmarkWhenCentralOverlayOpen and var22) and not (luaAppHideSduiCoachmarkWhenNotificationStreamOpen and var23)))))
		reactModule.useEffect(function()
			-- upvalues: var26 (ref), var25 (ref), p0 (ref), sendCoachmarkImpressionModule (copy)
			if not var26 or var25.current then return end
			local media = p0.media
			sendCoachmarkImpressionModule(p0.collectionServiceAnchorTag, if typeof(media) == "table" and next(media) == nil then false else media ~= nil)
			var25.current = true
		end, { var26, p0.collectionServiceAnchorTag, p0.media })
		
		return if var26 then reactModule.createElement(coachmark, {
			title = p0.title,
			text = p0.body,
			isOpen = if luaAppUseNavFocusInSduiCoachmark then true else var18 and not var16,
			side = p0.side,
			align = p0.align,
			anchorRef = var15,
			onClose = var24,
			actions = p0.actions,
			media = p0.media,
			testId = p0.testId
		}) else nil
	elseif var18 and not var16 and (not luaAppUseNavFocusInSduiCoachmark or var20) and ((not luaAppHideSduiCoachmarkWhenFlyoutOpen or not var21) and (not luaAppHideSduiCoachmarkWhenCentralOverlayOpen or not var22)) and (not luaAppHideSduiCoachmarkWhenNotificationStreamOpen or not var23) then
	else
		return nil
	end
end)