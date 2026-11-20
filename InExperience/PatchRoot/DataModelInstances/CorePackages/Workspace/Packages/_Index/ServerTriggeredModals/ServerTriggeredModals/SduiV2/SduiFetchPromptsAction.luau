local Parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local CentralOverlayModule = require(Parent.CentralOverlay)
local NotificationsUpsellModule = require(Parent.NotificationsUpsell)
local PromiseModule = require(Parent.Promise)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SharedFlagsModule = require(Parent.SharedFlags)
local FetchPromptsModule = require(script.Parent.fetchPrompts)
local PromptsEntryPointModule = require(script.Parent.PromptsEntryPoint)
local PromptStyleModule = require(script.Parent.PromptStyle)
local GetEntryPointSurfaceConfigModule = require(script.Parent.PromptsHandler.getEntryPointSurfaceConfig)
local CentralOverlayType = RobloxAppEnumsModule.CentralOverlayType
local SetCentralOverlayFunction = CentralOverlayModule.Actions.SetCentralOverlay
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local FFlagPromptsImpressionUsesTitle = SharedFlagsModule.FFlagPromptsImpressionUsesTitle
local FFlagSduiAllowNoConfigsBuilt = SharedFlagsModule.FFlagSduiAllowNoConfigsBuilt
local FetchPromptsActionTimeoutMs = game:DefineFastInt("FetchPromptsActionTimeoutMs", 2000)
local config = {
	[PromptsEntryPointModule.AppEventRsvpGoing] = PromptsEntryPointModule.AppEventRsvpGoing
}
local SduiFetchPromptsActionModule = {
	_buildPushPermissionClientAttributes = function()
		-- upvalues: NotificationsUpsellModule (copy)
		return NotificationsUpsellModule.PushPermissionClientAttributes.build()
	end
}

local function _(p1, Message, PropName)
	-- upvalues: SduiErrorType (copy)
	p1.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
		name = "FetchPrompts",
		message = Message,
		propName = PropName
	}, p1.appPage)
end

local function readClientAttributes(ClientAttributes)
	if ClientAttributes == nil then
		return {}
	end
	if typeof(ClientAttributes) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, clientAttribute in ClientAttributes do
		local ValueType = typeof(clientAttribute)
		
		if typeof(i) ~= "string" or ValueType ~= "string" and ValueType ~= "number" and ValueType ~= "boolean" then
			return nil
		end
		t[i] = tostring(clientAttribute)
	end
	return t
end

local _ = function(Tbl, p1)
	-- upvalues: PromiseModule (copy), SduiFetchPromptsActionModule (copy)
	return if p1 then SduiFetchPromptsActionModule._buildPushPermissionClientAttributes():andThen(function(Result)
		-- upvalues: Tbl (copy)
		if next(Result) == nil then
			return nil
		end
		local Copy = table.clone(Tbl)
		
		for i, value in Result do
			Copy[i] = value
		end
		return Copy
	end) else PromiseModule.resolve(Tbl)
end

local function findStoredEntry(ConfigKey, ModalId)
	-- upvalues: GetSduiApiStoreFunction (copy)
	local DataResult = GetSduiApiStoreFunction().getData(ConfigKey).data(false)
	
	if DataResult == nil then
		return nil
	end
	for _, value in DataResult do
		if typeof(value) == "table" and value.identifier == ModalId then
			return value
		end
	end
	return nil
end

local _ = function(p2, p3): boolean
	-- upvalues: CentralOverlayType (copy)
	local IsConfigKeyMatch = false
	p2.dependencies.dispatch(function(p4)
		-- upvalues: IsConfigKeyMatch (ref), CentralOverlayType (upval), p3 (copy)
		local CentralOverlay = p4:getState().CentralOverlay
		IsConfigKeyMatch = CentralOverlay ~= nil and (CentralOverlay.OverlayType == CentralOverlayType.SduiPromptModal and (CentralOverlay.Arguments ~= nil and CentralOverlay.Arguments.configKey == p3))
	end)
	
	return IsConfigKeyMatch
end

local _ = function(p2, p3): boolean
	-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	local v1 = false
	p2.dependencies.dispatch(function(p4)
		-- upvalues: SetCentralOverlayFunction (upval), CentralOverlayType (upval), p3 (copy), v1 (ref)
		local CentralOverlay = p4:getState().CentralOverlay
		
		if CentralOverlay == nil or CentralOverlay.OverlayType == nil then
			p4:dispatch(SetCentralOverlayFunction(CentralOverlayType.SduiPromptModal, p3))
			v1 = true
			
			return
		end
	end)
	
	return v1
end

local function fetchAndOpen(EntryPoint, p2, Tbl, IsIncludePushPermissionClientAttributes, p3)
	-- upvalues: PromiseModule (copy), SduiFetchPromptsActionModule (copy), FetchPromptsModule (copy), FFlagSduiAllowNoConfigsBuilt (copy), SduiLoadTimer (copy), PromptStyleModule (copy), findStoredEntry (copy), FFlagPromptsImpressionUsesTitle (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), SduiErrorType (copy), FetchPromptsActionTimeoutMs (copy)
	local ConfigKey = p2.configKey
	
	return PromiseModule.race({
		(if IsIncludePushPermissionClientAttributes then SduiFetchPromptsActionModule._buildPushPermissionClientAttributes():andThen(function(Result)
			-- upvalues: Tbl (copy)
			if next(Result) == nil then
				return nil
			end
			local Copy = table.clone(Tbl)
			
			for i, value in Result do
				Copy[i] = value
			end
			return Copy
		end) else PromiseModule.resolve(Tbl)):andThen(function(Result)
			-- upvalues: FetchPromptsModule (upval), EntryPoint (copy), p2 (copy), ConfigKey (copy), FFlagSduiAllowNoConfigsBuilt (upval), SduiLoadTimer (upval), PromptStyleModule (upval), PromiseModule (upval), findStoredEntry (upval), p3 (copy), FFlagPromptsImpressionUsesTitle (upval), SetCentralOverlayFunction (upval), CentralOverlayType (upval)
			if Result == nil then
				return false
			else
				local Identifier = nil
				
				return FetchPromptsModule({
					clearOnEmptyResponse = true,
					replaceOnFetch = nil,
					entryPoint = EntryPoint,
					surfaceKey = p2.surfaceKey,
					configKey = ConfigKey,
					allowNoConfigsBuilt = if FFlagSduiAllowNoConfigsBuilt then true else nil,
					loadTimer = SduiLoadTimer.createLoadTimer(ConfigKey),
					clientAttributes = Result,
					promptStyles = { PromptStyleModule.Modal }
				}, true, function(List)
					-- upvalues: PromptStyleModule (upval), Identifier (ref)
					for _, value in List do
						if value.category == PromptStyleModule.Modal and value.identifier ~= nil then
							Identifier = value.identifier
							break
						end
					end
				end):andThen(function()
					-- upvalues: Identifier (ref), PromiseModule (upval), findStoredEntry (upval), ConfigKey (upval), p3 (upval), p2 (upval), FFlagPromptsImpressionUsesTitle (upval), SetCentralOverlayFunction (upval), CentralOverlayType (upval)
					local ModalId = Identifier
					
					return ModalId ~= nil and PromiseModule.new(function(Callback)
						task.defer(Callback)
					end):andThen(function(): boolean
						-- upvalues: findStoredEntry (upval), ConfigKey (upval), ModalId (copy), p3 (upval), p2 (upval), FFlagPromptsImpressionUsesTitle (upval), SetCentralOverlayFunction (upval), CentralOverlayType (upval)
						local StoredEntry = findStoredEntry(ConfigKey, ModalId)
						
						if StoredEntry == nil or StoredEntry.robloxComponentType == nil or StoredEntry.config == nil or StoredEntry.title == nil then
							return false
						else
							local config = {
								configKey = ConfigKey,
								appPage = p3.appPage or p2.appPage,
								modalId = ModalId,
								modalType = if FFlagPromptsImpressionUsesTitle then StoredEntry.title else StoredEntry.robloxComponentType
							}
							local v1 = false
							p3.dependencies.dispatch(function(p4)
								-- upvalues: SetCentralOverlayFunction (upval), CentralOverlayType (upval), config (copy), v1 (ref)
								local CentralOverlay = p4:getState().CentralOverlay
								
								if CentralOverlay == nil or CentralOverlay.OverlayType == nil then
									p4:dispatch(SetCentralOverlayFunction(CentralOverlayType.SduiPromptModal, config))
									v1 = true
									
									return
								end
							end)
							
							return v1
						end
					end)
				end)
			end
		end):catch(function(Err): boolean
			-- upvalues: p3 (copy), SduiErrorType (upval)
			p3.dependencies.logger.reportError(SduiErrorType.ActionNetworkRequestFailed, {
				name = "FetchPrompts",
				message = `Prompts request failed: {tostring(Err)}`
			}, p3.appPage)
			
			return false
		end),
		PromiseModule.new(function(p4, _, Callback: (any) -> ())
			-- upvalues: FetchPromptsActionTimeoutMs (upval)
			local DelayedThread = task.delay(FetchPromptsActionTimeoutMs / 1000, p4, false)
			Callback(function()
				-- upvalues: DelayedThread (copy)
				task.cancel(DelayedThread)
			end)
		end)
	})
end

function SduiFetchPromptsActionModule.handler(p4, _, p5)
	-- upvalues: SduiErrorType (copy), config (copy), GetEntryPointSurfaceConfigModule (copy), readClientAttributes (copy), GetSduiApiStoreFunction (copy), CentralOverlayType (copy), fetchAndOpen (copy)
	local ActionParams = p4 and p4.actionParams or nil
	
	if ActionParams == nil then
		p5.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "FetchPrompts",
			message = "Missing actionParams",
			propName = nil
		}, p5.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local OnSettledFunction: (any) -> () = ActionParams.onSettled
	
	local function settle(Result)
		-- upvalues: OnSettledFunction (copy)
		if typeof(OnSettledFunction) == "function" then
			OnSettledFunction(Result)
		end
	end
	
	local EntryPoint = ActionParams.entryPoint
	local Entry = if typeof(EntryPoint) == "string" then config[EntryPoint] else nil
	
	if Entry == nil then
		p5.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "FetchPrompts",
			propName = "entryPoint",
			message = `Invalid entryPoint: {tostring(EntryPoint)}`
		}, p5.appPage)
		
		if typeof(OnSettledFunction) == "function" then
			OnSettledFunction(false)
		end
		return
	else
		local Success, Result = pcall(GetEntryPointSurfaceConfigModule, Entry)
		
		if Success then
			local ClientAttributes = readClientAttributes(ActionParams.clientAttributes)
			
			if ClientAttributes == nil then
				p5.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
					name = "FetchPrompts",
					message = "Invalid clientAttributes",
					propName = "clientAttributes"
				}, p5.appPage)
				
				if typeof(OnSettledFunction) == "function" then
					OnSettledFunction(false)
				end
				return
			elseif GetSduiApiStoreFunction().isInFlight(Result.configKey) then return end
			local ConfigKey = Result.configKey
			local IsConfigKeyMatch = false
			p5.dependencies.dispatch(function(p6)
				-- upvalues: IsConfigKeyMatch (ref), CentralOverlayType (upval), ConfigKey (copy)
				local CentralOverlay = p6:getState().CentralOverlay
				IsConfigKeyMatch = CentralOverlay ~= nil and (CentralOverlay.OverlayType == CentralOverlayType.SduiPromptModal and (CentralOverlay.Arguments ~= nil and CentralOverlay.Arguments.configKey == ConfigKey))
			end)
			
			if not IsConfigKeyMatch then
				fetchAndOpen(Entry, Result, ClientAttributes, ActionParams.includePushPermissionClientAttributes == true, p5):andThen(settle)
				
				return
			end
			return
		else
			p5.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
				name = "FetchPrompts",
				propName = "entryPoint",
				message = `No surface config for entryPoint: {Entry}`
			}, p5.appPage)
			
			if typeof(OnSettledFunction) == "function" then
				OnSettledFunction(false)
			end
		end
	end
end

return SduiFetchPromptsActionModule