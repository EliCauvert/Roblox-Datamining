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

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), luaAppUseNavFocusInSduiCoachmark (ref), useNavigationFocus (ref), luaAppHideSduiCoachmarkWhenFlyoutOpen (ref), useDrawerVisible (ref), luaAppHideSduiCoachmarkWhenCentralOverlayOpen (ref), useSelector (ref), luaAppHideSduiCoachmarkWhenNotificationStreamOpen (ref), useSignalState (ref), streamNotificationStore (ref), collectionService (ref), luaAppCoachmarkImpression (ref), sendCoachmarkImpressionModule (ref), coachmark (ref)
	local var1 = reactModule.useRef(nil)
	local var2, var3 = reactModule.useState(false)
	local var4, var5 = reactModule.useState(false)
	local var6 = if luaAppUseNavFocusInSduiCoachmark then useNavigationFocus() else nil
	local var7 = if luaAppHideSduiCoachmarkWhenFlyoutOpen then useDrawerVisible() else false
	local var8 = if luaAppHideSduiCoachmarkWhenCentralOverlayOpen then useSelector(function(p2)
		return p2.CentralOverlay.OverlayType ~= nil
	end) else nil
	local var9 = if luaAppHideSduiCoachmarkWhenNotificationStreamOpen then useSignalState(streamNotificationStore.getStreamPresented) else nil
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var5 (ref), collectionService (copy), p1 (ref)
		local function onTagAdded(p2)
			-- upvalues: var1 (copy), var5 (copy)
			if p2:IsA("GuiObject") then
				var1.current = p2
				var5(true)
				
				return
			end
		end
		
		local function onTagRemoved(_)
			-- upvalues: var1 (copy), var5 (copy)
			var1.current = nil
			var5(false)
		end
		
		for i, v in collectionService:GetTagged(p1.collectionServiceAnchorTag) do
			if v:IsA("GuiObject") then
				if not v:IsA("GuiObject") then break end
				var1.current = v
				var5(true)
				break
			end
		end
		local var10 = collectionService:GetInstanceAddedSignal(p1.collectionServiceAnchorTag):Connect(onTagAdded)
		local var11 = collectionService:GetInstanceRemovedSignal(p1.collectionServiceAnchorTag):Connect(onTagRemoved)
		
		return function()
			-- upvalues: var10 (ref), var11 (ref)
			var10:Disconnect()
			var11:Disconnect()
		end
	end, { p1.collectionServiceAnchorTag })
	local var12 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), p1 (ref)
		var3(true)
		
		if p1.onClose then
			p1.onClose()
		end
	end, { p1.onClose })
	
	if luaAppCoachmarkImpression then
		local var13 = reactModule.useRef(false)
		local var14 = var4 and (not var2 and (not (luaAppUseNavFocusInSduiCoachmark and not var6) and (not (luaAppHideSduiCoachmarkWhenFlyoutOpen and var7) and (not (luaAppHideSduiCoachmarkWhenCentralOverlayOpen and var8) and not (luaAppHideSduiCoachmarkWhenNotificationStreamOpen and var9)))))
		reactModule.useEffect(function()
			-- upvalues: var14 (ref), var13 (ref), p1 (ref), sendCoachmarkImpressionModule (copy)
			if not var14 or var13.current then return end
			local media = p1.media
			sendCoachmarkImpressionModule(p1.collectionServiceAnchorTag, if typeof(media) == "table" and next(media) == nil then false else media ~= nil)
			var13.current = true
		end, { var14, p1.collectionServiceAnchorTag, p1.media })
		
		return if var14 then reactModule.createElement(coachmark, {
			title = p1.title,
			text = p1.body,
			isOpen = if luaAppUseNavFocusInSduiCoachmark then true else var4 and not var2,
			side = p1.side,
			align = p1.align,
			anchorRef = var1,
			onClose = var12,
			actions = p1.actions,
			media = p1.media,
			testId = p1.testId
		}) else nil
	elseif var4 and not var2 and (not luaAppUseNavFocusInSduiCoachmark or var6) and ((not luaAppHideSduiCoachmarkWhenFlyoutOpen or not var7) and (not luaAppHideSduiCoachmarkWhenCentralOverlayOpen or not var8)) and (not luaAppHideSduiCoachmarkWhenNotificationStreamOpen or not var9) then
	else
		return nil
	end
end)