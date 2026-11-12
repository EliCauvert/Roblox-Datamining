local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local CryoModule = require(Parent1.Cryo)
local UseStateFunction = ReactModule.useState
local PromptConnectionsModule = require(Parent.Components.CoreUI.PromptConnections)
local _ = require(Parent.Common.InGameRsvpPushUpsellTypes)
local FocusNavigationUtilsModule = require(Parent1.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FixFocusWhenInGameMenuIsOpen = game:DefineFastFlag("FixFocusWhenInGameMenuIsOpen", false)
local FFlagInGameRsvpPushUpsellEnabled = require(Parent1.SharedFlags).FFlagInGameRsvpPushUpsellEnabled
local FIntInGameRsvpPushUpsellDelayMsModule = require(Parent.Flags.FIntInGameRsvpPushUpsellDelayMs)
local FetchInGameRsvpPushUpsellModule = if FFlagInGameRsvpPushUpsellEnabled then require(Parent.Common.fetchInGameRsvpPushUpsell) else nil
local IsInGameMenuOpenModule = if FFlagInGameRsvpPushUpsellEnabled then require(Parent.Common.isInGameMenuOpen) else nil
local PushUpsellPromptContainerModule = if FFlagInGameRsvpPushUpsellEnabled then require(Parent.Components.CoreUI.PushUpsellPrompt.PushUpsellPromptContainer) else nil
local config = {
	PromptRsvp = require(Parent.Components.CoreUI.RsvpPrompt)
}

if FFlagInGameRsvpPushUpsellEnabled then
	config.PromptPushUpsell = PushUpsellPromptContainerModule
end
local function enqueuePrompt(p1, p2)
	-- upvalues: CryoModule (copy)
	return if p1.promptType == nil then {
		promptType = p2.promptType,
		promptData = p2.promptData,
		promptQueue = {}
	} else CryoModule.Dictionary.join(p1, {
		promptQueue = CryoModule.List.join(p1.promptQueue, { p2 })
	})
end

local function dequeuePrompt(p1)
	-- upvalues: CryoModule (copy)
	return if CryoModule.isEmpty(p1.promptQueue) then { promptType = nil, promptData = {}, promptQueue = {} } else CryoModule.Dictionary.join(p1, {
		promptType = p1.promptQueue[1].promptType,
		promptData = p1.promptQueue[1].promptData,
		promptQueue = CryoModule.List.removeIndex(p1.promptQueue, 1)
	})
end

local function usePushUpsellPromptQueue(Callback)
	-- upvalues: ReactModule (copy), enqueuePrompt (copy), FetchInGameRsvpPushUpsellModule (copy), FIntInGameRsvpPushUpsellDelayMsModule (copy), IsInGameMenuOpenModule (copy)
	local UseRefResult = ReactModule.useRef(true)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = true
		
		return function()
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = false
		end
	end, {})
	local UseRefResult1 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function(PromptData)
		-- upvalues: UseRefResult1 (copy), Callback (copy), enqueuePrompt (upval)
		if not UseRefResult1.current then
			UseRefResult1.current = true
			Callback(function(p1)
				-- upvalues: enqueuePrompt (upval), PromptData (copy)
				return enqueuePrompt(p1, { promptType = "PromptPushUpsell", promptData = PromptData })
			end)
			
			return
		end
	end, { Callback })
	
	return ReactModule.useCallback(function(EventId)
		-- upvalues: FetchInGameRsvpPushUpsellModule (upval), FIntInGameRsvpPushUpsellDelayMsModule (upval), UseRefResult (copy), IsInGameMenuOpenModule (upval), UseResult (copy)
		FetchInGameRsvpPushUpsellModule.fetch():andThen(function(Result)
			-- upvalues: FIntInGameRsvpPushUpsellDelayMsModule (upval), UseRefResult (upval), IsInGameMenuOpenModule (upval), UseResult (upval), EventId (copy)
			if Result ~= nil then
				task.delay(FIntInGameRsvpPushUpsellDelayMsModule / 1000, function()
					-- upvalues: UseRefResult (upval), IsInGameMenuOpenModule (upval), UseResult (upval), Result (copy), EventId (upval)
					if UseRefResult.current and not IsInGameMenuOpenModule() then
						UseResult({
							promptType = Result.promptType,
							path = Result.path,
							translations = Result.translations,
							eventId = EventId
						})
						
						return
					end
				end)
				
				return
			end
		end)
	end, { UseResult })
end

local function usePushUpsellPromptQueueDisabled(_)
	return nil
end

local Callback = if FFlagInGameRsvpPushUpsellEnabled then usePushUpsellPromptQueue else usePushUpsellPromptQueueDisabled

return function(p1)
	-- upvalues: UseStateFunction (copy), ReactModule (copy), FFlagInGameRsvpPushUpsellEnabled (copy), dequeuePrompt (copy), CryoModule (copy), Callback (copy), config (copy), enqueuePrompt (copy), FixFocusWhenInGameMenuIsOpen (copy), GuiService (copy), PromptConnectionsModule (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction({ promptType = nil, promptData = nil, promptQueue = {} })
	local PromptData = UseStateResult.promptData
	local PromptType = UseStateResult.promptType
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagInGameRsvpPushUpsellEnabled (upval), UseStateResult2 (copy), dequeuePrompt (upval), CryoModule (upval), UseStateResult (copy)
		if FFlagInGameRsvpPushUpsellEnabled then
			UseStateResult2(dequeuePrompt)
			
			return
		end
		if CryoModule.isEmpty(UseStateResult.promptQueue) then
			UseStateResult2({ promptType = nil, promptData = {}, promptQueue = {} })
			
			return
		else
			UseStateResult2(CryoModule.Dictionary.join(UseStateResult, {
				promptType = UseStateResult.promptQueue[1].promptType,
				promptData = UseStateResult.promptQueue[1].promptData,
				promptQueue = CryoModule.List.removeIndex(UseStateResult.promptQueue, 1)
			}))
		end
	end, { UseStateResult, UseStateResult2 })
	local CallbackResult = Callback(UseStateResult2)
	local Element = nil
	
	if PromptType then
		local Entry = config[PromptType]
		
		if Entry then
			Element = ReactModule.createElement(Entry, {
				enableInputDelayed = p1.enableInputDelayed,
				promptData = PromptData,
				closePrompt = UseResult,
				overrideUseWideMode = p1.overrideUseWideMode,
				onRsvpGoingSucceeded = CallbackResult
			})
		else
			error(`Unexpected prompt type: {PromptType}!`)
		end
	end
	local UseResult1 = ReactModule.useCallback(function(EventId, EventDetails)
		-- upvalues: FFlagInGameRsvpPushUpsellEnabled (upval), UseStateResult2 (copy), enqueuePrompt (upval), UseStateResult (copy), CryoModule (upval)
		if FFlagInGameRsvpPushUpsellEnabled then
			UseStateResult2(function(p2)
				-- upvalues: enqueuePrompt (upval), EventId (copy), EventDetails (copy)
				return enqueuePrompt(p2, {
					promptType = "PromptRsvp",
					promptData = { eventId = EventId, eventDetails = EventDetails }
				})
			end)
			
			return
		end
		if UseStateResult.promptType == nil then
			UseStateResult2({
				promptType = "PromptRsvp",
				promptData = { eventId = EventId, eventDetails = EventDetails },
				promptQueue = {}
			})
			
			return
		else
			UseStateResult2(CryoModule.Dictionary.join(UseStateResult, {
				promptQueue = CryoModule.List.join(UseStateResult.promptQueue, {
					{
						promptType = "PromptRsvp",
						promptData = { eventId = EventId, eventDetails = EventDetails }
					}
				})
			}))
		end
	end, { UseStateResult, UseStateResult2 })
	local v1 = nil
	local UseStateResult2_1 = nil
	
	if FixFocusWhenInGameMenuIsOpen then
		v1, UseStateResult2_1 = ReactModule.useState(GuiService.MenuIsOpen)
		ReactModule.useEffect(function()
			-- upvalues: Element (ref), UseStateResult2_1 (ref), GuiService (upval)
			if not Element then return end
			UseStateResult2_1(GuiService.MenuIsOpen)
			local MenuOpenedConnection = GuiService.MenuOpened:Connect(function()
				-- upvalues: UseStateResult2_1 (upval)
				UseStateResult2_1(true)
			end)
			local MenuClosedConnection = GuiService.MenuClosed:Connect(function()
				-- upvalues: UseStateResult2_1 (upval)
				UseStateResult2_1(false)
			end)
			
			return function()
				-- upvalues: MenuOpenedConnection (copy), MenuClosedConnection (copy)
				MenuOpenedConnection:Disconnect()
				MenuClosedConnection:Disconnect()
			end
		end, { Element })
	end
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		PromptConnections = ReactModule.createElement(PromptConnectionsModule, { openRsvpPrompt = UseResult1, closePrompt = UseResult }),
		FocusNavigationCoreScriptsWrapper = if Element then ReactModule.createElement(FocusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay,
			isFocusable = if FixFocusWhenInGameMenuIsOpen then not v1 else nil
		}, { Prompt = Element }) else nil
	})
end