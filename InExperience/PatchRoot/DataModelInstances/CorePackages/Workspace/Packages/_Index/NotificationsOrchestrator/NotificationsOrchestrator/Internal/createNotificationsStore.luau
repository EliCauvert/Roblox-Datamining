local NotificationsOrchestrator = script:FindFirstAncestor("NotificationsOrchestrator")
local Parent = NotificationsOrchestrator.Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local OrchestratorDebugLoggerModule = require(NotificationsOrchestrator.Internal.OrchestratorDebugLogger)
local ExposureTrackerModule = require(NotificationsOrchestrator.Internal.ExposureTracker)
local FFlagEnableNotificationsOrchestratorUnifiedLoggingModule = require(NotificationsOrchestrator.Flags.FFlagEnableNotificationsOrchestratorUnifiedLogging)
local EvaluateModule = require(NotificationsOrchestrator.Internal.evaluate)
local SlotGroupBySlotIdModule = require(NotificationsOrchestrator.Config.SlotGroupBySlotId)
local SlotConfigBySlotIdModule = require(NotificationsOrchestrator.Config.SlotConfigBySlotId)
local GetSlotConfigFunction = SlotConfigBySlotIdModule.getSlotConfig
local SlotConfigBySlotId = SlotConfigBySlotIdModule.SlotConfigBySlotId
local GetSlotGroupConfigFunction = require(NotificationsOrchestrator.Config.SlotGroupConfigByGroupId).getSlotGroupConfig
local _ = require(NotificationsOrchestrator.Types)
local RunService = game:GetService("RunService")

local function _(p1)
	-- upvalues: NotificationsOrchestrator (copy)
	pcall(function()
		-- upvalues: NotificationsOrchestrator (upval), p1 (copy)
		require(NotificationsOrchestrator.Analytics.sendNotificationReportUnifiedEvent).send(p1)
	end)
end

local _ = function(Active, EventType, Reason, ActionId)
	return {
		slot = Active.slotId,
		eventType = EventType,
		reason = Reason,
		actionId = ActionId,
		handle = Active.handle,
		lifecycleKey = Active.lifecycleKey,
		source = Active.source,
		itemId = Active.itemId,
		itemType = Active.itemType
	}
end

return function()
	-- upvalues: LocalUserIdStore (copy), CreateSessionScopedSignalFunction (copy), SlotGroupBySlotIdModule (copy), SlotConfigBySlotId (copy), GetSlotGroupConfigFunction (copy), GetSlotConfigFunction (copy), EvaluateModule (copy), ExposureTrackerModule (copy), FFlagEnableNotificationsOrchestratorUnifiedLoggingModule (copy), NotificationsOrchestrator (copy), OrchestratorDebugLoggerModule (copy), RunService (copy)
	local t = {}
	local Tbl = {}
	local Tbl1 = {}
	local Count = 0
	local SubmissionOrder = 0
	local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
	local InExperienceShopOpen = false
	
	local function _()
		-- upvalues: LocalUserIdStore (upval), CurrentUserId (ref), Tbl (copy), Tbl1 (copy)
		local CurrentUserId1 = LocalUserIdStore.getCurrentUserId(false)
		
		if CurrentUserId1 ~= CurrentUserId then
			CurrentUserId = CurrentUserId1
			table.clear(Tbl)
			table.clear(Tbl1)
			
			return
		end
	end
	
	local _ = function(Key)
		-- upvalues: t (copy), CreateSessionScopedSignalFunction (upval)
		local Entry = t[Key]
		
		if Entry == nil then
			local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(nil)
			local config = {
				getActive = SessionScopedSignal,
				setActive = SessionScopedSignal2
			}
			t[Key] = config
			
			return config
		else
			return Entry
		end
	end
	
	local _ = function(p1)
		-- upvalues: SlotGroupBySlotIdModule (upval)
		return SlotGroupBySlotIdModule[p1]
	end
	
	local _ = function(p1): string
		-- upvalues: SlotGroupBySlotIdModule (upval)
		local SlotGroupBySlotIdModuleEntry = SlotGroupBySlotIdModule[p1]
		
		return if SlotGroupBySlotIdModuleEntry == nil then `slot:{p1}` else `group:{SlotGroupBySlotIdModuleEntry}`
	end
	
	local _ = function(Key)
		-- upvalues: Tbl1 (copy)
		local Entry = Tbl1[Key]
		
		if Entry == nil then
			local config = { active = nil, waiting = {} }
			Tbl1[Key] = config
			
			return config
		else
			return Entry
		end
	end
	
	local function publish(Active)
		-- upvalues: t (copy), CreateSessionScopedSignalFunction (upval)
		local Payload = Active.payload
		
		if Payload == nil then
			local SlotId = Active.slotId
			local Entry = t[SlotId]
			local Entry2 = nil
			
			if Entry == nil then
				local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(nil)
				local config = {
					getActive = SessionScopedSignal,
					setActive = SessionScopedSignal2
				}
				t[SlotId] = config
				Entry2 = config
			else
				Entry2 = Entry
			end
			Entry2.setActive(nil)
			
			return
		else
			local SlotId1 = Active.slotId
			local Entry1 = t[SlotId1]
			local Entry = nil
			
			if Entry1 == nil then
				local SessionScopedSignal1, SessionScopedSignal2_1 = CreateSessionScopedSignalFunction(nil)
				local config = {
					getActive = SessionScopedSignal1,
					setActive = SessionScopedSignal2_1
				}
				t[SlotId1] = config
				Entry = config
			else
				Entry = Entry1
			end
			Entry.setActive({ handle = Active.handle, payload = Payload })
		end
	end
	
	local function removeFromWaiting(List, Active)
		for i, value in List do
			if value == Active then
				table.remove(List, i)
				break
			end
		end
	end
	
	local _ = function(p1)
		local LifecyclePolicy = p1.lifecyclePolicy
		
		return if LifecyclePolicy == nil then nil else LifecyclePolicy.frequency
	end
	
	local function resolveFrequency(Active)
		-- upvalues: SlotConfigBySlotId (upval), SlotGroupBySlotIdModule (upval), GetSlotGroupConfigFunction (upval), GetSlotConfigFunction (upval)
		local LifecyclePolicy = Active.lifecyclePolicy
		local Frequency = if LifecyclePolicy == nil then nil else LifecyclePolicy.frequency
		
		if Frequency ~= nil then
			return Frequency
		end
		local SlotConfigBySlotIdEntry = SlotConfigBySlotId[Active.slotId]
		
		if SlotConfigBySlotIdEntry ~= nil then
			local Lifecycle = SlotConfigBySlotIdEntry.lifecycle
			local Frequency1 = if Lifecycle == nil then nil else Lifecycle.frequency
			
			if Frequency1 ~= nil then
				return Frequency1
			end
		end
		local SlotGroupBySlotIdModuleEntry = SlotGroupBySlotIdModule[Active.slotId]
		
		if SlotGroupBySlotIdModuleEntry ~= nil then
			return GetSlotGroupConfigFunction(SlotGroupBySlotIdModuleEntry).frequency
		elseif SlotConfigBySlotIdEntry == nil then
			local Lifecycle = GetSlotConfigFunction(Active.slotId).lifecycle
			
			return if Lifecycle == nil then nil else Lifecycle.frequency
		else
			return nil
		end
	end
	
	local _ = function(p1)
		local Window = if p1 == nil then nil else p1.window
		
		return if Window == nil then "forever" else Window
	end
	
	local _ = function(p1, p2, p3)
		-- upvalues: EvaluateModule (upval), ExposureTrackerModule (upval)
		return EvaluateModule(p2, p3, function()
			-- upvalues: ExposureTrackerModule (upval), p1 (copy), p3 (copy)
			return ExposureTrackerModule.getExposure(p1, p3)
		end, ExposureTrackerModule.now())
	end
	
	local _ = function(p1)
		return if typeof(p1) == "table" then `rolling:{p1.seconds}s` else p1
	end
	
	local function takeHighestPriority(List)
		-- upvalues: InExperienceShopOpen (ref), Tbl (copy), FFlagEnableNotificationsOrchestratorUnifiedLoggingModule (upval), NotificationsOrchestrator (upval), EvaluateModule (upval), ExposureTrackerModule (upval), OrchestratorDebugLoggerModule (upval), removeFromWaiting (copy)
		local Active = nil
		
		for i = #List, 1, -1 do
			local Entry = List[i]
			
			if InExperienceShopOpen and Entry.suppressWhileInExperienceShopOpen then
				Tbl[Entry.handle] = nil
				table.remove(List, i)
				
				if FFlagEnableNotificationsOrchestratorUnifiedLoggingModule then
					local config = {
						eventType = "suppressed",
						reason = nil,
						actionId = nil,
						slot = Entry.slotId,
						handle = Entry.handle,
						lifecycleKey = Entry.lifecycleKey,
						source = Entry.source,
						itemId = Entry.itemId,
						itemType = Entry.itemType
					}
					pcall(function()
						-- upvalues: NotificationsOrchestrator (upval), config (copy)
						require(NotificationsOrchestrator.Analytics.sendNotificationReportUnifiedEvent).send(config)
					end)
				end
			else
				local LifecycleKey = Entry.lifecycleKey
				local Window = Entry.window
				
				if EvaluateModule(Entry.frequency, Window, function()
					-- upvalues: ExposureTrackerModule (upval), LifecycleKey (copy), Window (copy)
					return ExposureTrackerModule.getExposure(LifecycleKey, Window)
				end, ExposureTrackerModule.now()) then
					if Active == nil or (Active.priority < Entry.priority or Entry.priority == Active.priority and Entry.submissionOrder < Active.submissionOrder) then
						Active = Entry
					end
				else
					OrchestratorDebugLoggerModule.logLazy(function(): string
						-- upvalues: Entry (copy), ExposureTrackerModule (upval)
						local Frequency = Entry.frequency
						local Window = Entry.window
						
						return `drop ineligible: handle={Entry.handle} slotId={Entry.slotId} lifecycleKey={Entry.lifecycleKey} count={ExposureTrackerModule.getCount(Entry.lifecycleKey, Entry.window)} maxImpressions={if Frequency == nil then nil else Frequency.maxImpressions} cooldownSeconds={if Frequency == nil then nil else Frequency.cooldownSeconds} window={if typeof(Window) == "table" then `rolling:{Window.seconds}s` else Window}`
					end)
					Tbl[Entry.handle] = nil
					table.remove(List, i)
					
					if FFlagEnableNotificationsOrchestratorUnifiedLoggingModule then
						local config1 = {
							eventType = "promoteDropped",
							reason = "frequency",
							actionId = nil,
							slot = Entry.slotId,
							handle = Entry.handle,
							lifecycleKey = Entry.lifecycleKey,
							source = Entry.source,
							itemId = Entry.itemId,
							itemType = Entry.itemType
						}
						pcall(function()
							-- upvalues: NotificationsOrchestrator (upval), config1 (copy)
							require(NotificationsOrchestrator.Analytics.sendNotificationReportUnifiedEvent).send(config1)
						end)
					end
				end
			end
		end
		if Active == nil then
			return nil
		else
			removeFromWaiting(List, Active)
			
			return Active
		end
	end
	
	local function removeEntry(Active)
		-- upvalues: Tbl (copy), Tbl1 (copy), OrchestratorDebugLoggerModule (upval), removeFromWaiting (copy), t (copy), CreateSessionScopedSignalFunction (upval), takeHighestPriority (copy), publish (copy)
		Tbl[Active.handle] = nil
		local Entry = Tbl1[Active.queueKey]
		
		if Entry == nil then
			OrchestratorDebugLoggerModule.logLazy(function(): string
				-- upvalues: Active (copy)
				return `remove: handle={Active.handle} slotId={Active.slotId} lifecycleKey={Active.lifecycleKey} queue=missing`
			end)
			
			return
		end
		if Entry.active ~= Active then
			removeFromWaiting(Entry.waiting, Active)
			OrchestratorDebugLoggerModule.logLazy(function(): string
				-- upvalues: Active (copy)
				return `remove waiting: handle={Active.handle} slotId={Active.slotId} lifecycleKey={Active.lifecycleKey}`
			end)
			
			return
		end
		Entry.active = nil
		local SlotId = Active.slotId
		local Entry1 = t[SlotId]
		local Entry2 = nil
		
		if Entry1 == nil then
			local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(nil)
			local config = {
				getActive = SessionScopedSignal,
				setActive = SessionScopedSignal2
			}
			t[SlotId] = config
			Entry2 = config
		else
			Entry2 = Entry1
		end
		Entry2.setActive(nil)
		local TakeHighestPriorityResult = takeHighestPriority(Entry.waiting)
		
		if TakeHighestPriorityResult == nil then
			OrchestratorDebugLoggerModule.logLazy(function(): string
				-- upvalues: Active (copy)
				return `remove active: handle={Active.handle} slotId={Active.slotId} lifecycleKey={Active.lifecycleKey} slot=empty`
			end)
			
			return
		else
			OrchestratorDebugLoggerModule.logLazy(function(): string
				-- upvalues: Active (copy), TakeHighestPriorityResult (copy)
				return `remove active: handle={Active.handle} slotId={Active.slotId} lifecycleKey={Active.lifecycleKey} promote={TakeHighestPriorityResult.handle}`
			end)
			Entry.active = TakeHighestPriorityResult
			publish(TakeHighestPriorityResult)
		end
	end
	
	return {
		submit = function(Active): string?
			-- upvalues: LocalUserIdStore (upval), CurrentUserId (ref), Tbl (copy), Tbl1 (copy), RunService (upval), OrchestratorDebugLoggerModule (upval), InExperienceShopOpen (ref), FFlagEnableNotificationsOrchestratorUnifiedLoggingModule (upval), NotificationsOrchestrator (upval), resolveFrequency (copy), EvaluateModule (upval), ExposureTrackerModule (upval), Count (ref), SubmissionOrder (ref), SlotGroupBySlotIdModule (upval), publish (copy)
			local CurrentUserId1 = LocalUserIdStore.getCurrentUserId(false)
			
			if CurrentUserId1 ~= CurrentUserId then
				CurrentUserId = CurrentUserId1
				table.clear(Tbl)
				table.clear(Tbl1)
			end
			if (Active.enableOnStudio == nil or not Active.enableOnStudio) and RunService:IsStudio() then
				OrchestratorDebugLoggerModule.logLazy(function(): string
					-- upvalues: Active (copy)
					return `submit discarded: slotId={Active.slotId} lifecycleKey={Active.lifecycleKey} reason=studio`
				end)
				
				return nil
			end
			if InExperienceShopOpen and Active.suppressWhileInExperienceShopOpen then
				OrchestratorDebugLoggerModule.logLazy(function(): string
					-- upvalues: Active (copy)
					return `submit discarded: slotId={Active.slotId} lifecycleKey={Active.lifecycleKey} reason=shopOpen`
				end)
				
				if FFlagEnableNotificationsOrchestratorUnifiedLoggingModule then
					local config = {
						eventType = "suppressed",
						slot = Active.slotId,
						lifecycleKey = Active.lifecycleKey,
						source = Active.source,
						itemId = Active.itemId,
						itemType = Active.itemType
					}
					pcall(function()
						-- upvalues: NotificationsOrchestrator (upval), config (copy)
						require(NotificationsOrchestrator.Analytics.sendNotificationReportUnifiedEvent).send(config)
					end)
				end
				return nil
			else
				OrchestratorDebugLoggerModule.logLazy(function(): string
					-- upvalues: Active (copy)
					return `submit: slotId={Active.slotId} lifecycleKey={Active.lifecycleKey}`
				end)
				local ResolveFrequencyResult = resolveFrequency(Active)
				local Window = if ResolveFrequencyResult == nil then nil else ResolveFrequencyResult.window
				local Forever = if Window == nil then "forever" else Window
				local LifecycleKey = Active.lifecycleKey
				
				if EvaluateModule(ResolveFrequencyResult, Forever, function()
					-- upvalues: ExposureTrackerModule (upval), LifecycleKey (copy), Forever (copy)
					return ExposureTrackerModule.getExposure(LifecycleKey, Forever)
				end, ExposureTrackerModule.now()) then
					Count += 1
					SubmissionOrder += 1
					local Text = tostring(Count)
					local SlotId = Active.slotId
					local SlotGroupBySlotIdModuleEntry = SlotGroupBySlotIdModule[SlotId]
					local Active1 = {
						handle = Text,
						slotId = Active.slotId,
						lifecycleKey = Active.lifecycleKey,
						window = Forever,
						frequency = ResolveFrequencyResult,
						priority = if Active.priority == nil then 0 else Active.priority,
						payload = Active.slotDisplayPayload,
						source = if FFlagEnableNotificationsOrchestratorUnifiedLoggingModule then Active.source else nil,
						itemId = if FFlagEnableNotificationsOrchestratorUnifiedLoggingModule then Active.itemId else nil,
						itemType = if FFlagEnableNotificationsOrchestratorUnifiedLoggingModule then Active.itemType else nil,
						submissionOrder = SubmissionOrder,
						queueKey = if SlotGroupBySlotIdModuleEntry == nil then `slot:{SlotId}` else `group:{SlotGroupBySlotIdModuleEntry}`,
						suppressWhileInExperienceShopOpen = Active.suppressWhileInExperienceShopOpen
					}
					Tbl[Text] = Active1
					local QueueKey = Active1.queueKey
					local Entry = Tbl1[QueueKey]
					local Entry1 = nil
					
					if Entry == nil then
						local config2 = { active = nil, waiting = {} }
						Tbl1[QueueKey] = config2
						Entry1 = config2
					else
						Entry1 = Entry
					end
					if Entry1.active == nil then
						OrchestratorDebugLoggerModule.logLazy(function(): string
							-- upvalues: Text (copy), Active1 (copy)
							return `submit shown: handle={Text} slotId={Active1.slotId} lifecycleKey={Active1.lifecycleKey}`
						end)
						Entry1.active = Active1
						publish(Active1)
						
						return Text
					end
					local Handle = Entry1.active.handle
					OrchestratorDebugLoggerModule.logLazy(function(): string
						-- upvalues: Text (copy), Active1 (copy), Handle (copy)
						return `submit queued: handle={Text} slotId={Active1.slotId} lifecycleKey={Active1.lifecycleKey} behind={Handle}`
					end)
					table.insert(Entry1.waiting, Active1)
					
					if FFlagEnableNotificationsOrchestratorUnifiedLoggingModule then
						local config3 = {
							eventType = "queued",
							reason = nil,
							actionId = nil,
							slot = Active1.slotId,
							handle = Active1.handle,
							lifecycleKey = Active1.lifecycleKey,
							source = Active1.source,
							itemId = Active1.itemId,
							itemType = Active1.itemType
						}
						pcall(function()
							-- upvalues: NotificationsOrchestrator (upval), config3 (copy)
							require(NotificationsOrchestrator.Analytics.sendNotificationReportUnifiedEvent).send(config3)
						end)
					end
					return Text
				else
					OrchestratorDebugLoggerModule.logLazy(function(): string
						-- upvalues: ResolveFrequencyResult (copy), ExposureTrackerModule (upval), Active (copy), Forever (copy)
						return `submit discarded: slotId={Active.slotId} lifecycleKey={Active.lifecycleKey} count={ExposureTrackerModule.getCount(Active.lifecycleKey, Forever)} maxImpressions={if ResolveFrequencyResult == nil then nil else ResolveFrequencyResult.maxImpressions} cooldownSeconds={if ResolveFrequencyResult == nil then nil else ResolveFrequencyResult.cooldownSeconds} window={if typeof(Forever) == "table" then `rolling:{Forever.seconds}s` else Forever}`
					end)
					
					if FFlagEnableNotificationsOrchestratorUnifiedLoggingModule then
						local config1 = {
							eventType = "submitDropped",
							reason = "frequency",
							slot = Active.slotId,
							lifecycleKey = Active.lifecycleKey,
							source = Active.source,
							itemId = Active.itemId,
							itemType = Active.itemType
						}
						pcall(function()
							-- upvalues: NotificationsOrchestrator (upval), config1 (copy)
							require(NotificationsOrchestrator.Analytics.sendNotificationReportUnifiedEvent).send(config1)
						end)
					end
					return nil
				end
			end
		end,
		revoke = function(p1)
			-- upvalues: LocalUserIdStore (upval), CurrentUserId (ref), Tbl (copy), Tbl1 (copy), OrchestratorDebugLoggerModule (upval), removeEntry (copy), FFlagEnableNotificationsOrchestratorUnifiedLoggingModule (upval), NotificationsOrchestrator (upval)
			local CurrentUserId1 = LocalUserIdStore.getCurrentUserId(false)
			
			if CurrentUserId1 ~= CurrentUserId then
				CurrentUserId = CurrentUserId1
				table.clear(Tbl)
				table.clear(Tbl1)
			end
			OrchestratorDebugLoggerModule.logLazy(function(): string
				-- upvalues: p1 (copy)
				return `revoke: handle={p1}`
			end)
			local Entry = Tbl[p1]
			
			if Entry == nil then
				OrchestratorDebugLoggerModule.logLazy(function(): string
					-- upvalues: p1 (copy)
					return `revoke ignored: handle={p1}`
				end)
				
				return
			end
			removeEntry(Entry)
			
			if FFlagEnableNotificationsOrchestratorUnifiedLoggingModule then
				local config = {
					eventType = "revoked",
					reason = nil,
					actionId = nil,
					slot = Entry.slotId,
					handle = Entry.handle,
					lifecycleKey = Entry.lifecycleKey,
					source = Entry.source,
					itemId = Entry.itemId,
					itemType = Entry.itemType
				}
				pcall(function()
					-- upvalues: NotificationsOrchestrator (upval), config (copy)
					require(NotificationsOrchestrator.Analytics.sendNotificationReportUnifiedEvent).send(config)
				end)
			end
		end,
		report = function(Slot, LifecycleKey, p1)
			-- upvalues: LocalUserIdStore (upval), CurrentUserId (ref), Tbl (copy), Tbl1 (copy), OrchestratorDebugLoggerModule (upval), FFlagEnableNotificationsOrchestratorUnifiedLoggingModule (upval), NotificationsOrchestrator (upval), ExposureTrackerModule (upval), EvaluateModule (upval), removeEntry (copy)
			local CurrentUserId1 = LocalUserIdStore.getCurrentUserId(false)
			
			if CurrentUserId1 ~= CurrentUserId then
				CurrentUserId = CurrentUserId1
				table.clear(Tbl)
				table.clear(Tbl1)
			end
			OrchestratorDebugLoggerModule.logLazy(function(): string
				-- upvalues: Slot (copy), LifecycleKey (copy), p1 (copy)
				return `report: slot={Slot} key={LifecycleKey} event={p1.type}`
			end)
			
			if p1.type ~= "suppressed" then
				local Entry = Tbl[LifecycleKey]
				
				if Entry == nil or Entry.slotId ~= Slot then
					OrchestratorDebugLoggerModule.logLazy(function(): string
						-- upvalues: Slot (copy), LifecycleKey (copy), p1 (copy)
						return `report ignored: slot={Slot} key={LifecycleKey} event={p1.type}`
					end)
					
					return
				end
				local Flag = false
				
				if p1.type == "viewed" then
					ExposureTrackerModule.record(Entry.lifecycleKey, Entry.window)
					local Frequency = Entry.frequency
					local MaxImpressions = if Frequency == nil then nil else Frequency.maxImpressions
					local NewMaxImpressions = if MaxImpressions == nil then nil else MaxImpressions + 1
					
					if NewMaxImpressions ~= nil then
						local LifecycleKey1 = Entry.lifecycleKey
						local Window = Entry.window
						
						if not EvaluateModule({ maxImpressions = NewMaxImpressions }, Window, function()
							-- upvalues: ExposureTrackerModule (upval), LifecycleKey1 (copy), Window (copy)
							return ExposureTrackerModule.getExposure(LifecycleKey1, Window)
						end, ExposureTrackerModule.now()) then
							OrchestratorDebugLoggerModule.logLazy(function(): string
								-- upvalues: ExposureTrackerModule (upval), Entry (copy), MaxImpressions (copy)
								local Window = Entry.window
								
								return `maxImpressions reached: handle={Entry.handle} slotId={Entry.slotId} lifecycleKey={Entry.lifecycleKey} count={ExposureTrackerModule.getCount(Entry.lifecycleKey, Entry.window)} maxImpressions={MaxImpressions} window={if typeof(Window) == "table" then `rolling:{Window.seconds}s` else Window}`
							end)
							removeEntry(Entry)
							Flag = true
						end
					end
				elseif p1.type == "dismissed" then
					removeEntry(Entry)
				end
				if FFlagEnableNotificationsOrchestratorUnifiedLoggingModule then
					local Reason = nil
					local ActionId = nil
					
					if p1.type == "dismissed" then
						Reason = p1.reason
					elseif p1.type == "activated" then
						ActionId = p1.actionId
					end
					local config1 = {
						slot = Entry.slotId,
						eventType = p1.type,
						reason = Reason,
						actionId = ActionId,
						handle = Entry.handle,
						lifecycleKey = Entry.lifecycleKey,
						source = Entry.source,
						itemId = Entry.itemId,
						itemType = Entry.itemType
					}
					pcall(function()
						-- upvalues: NotificationsOrchestrator (upval), config1 (copy)
						require(NotificationsOrchestrator.Analytics.sendNotificationReportUnifiedEvent).send(config1)
					end)
					
					if Flag then
						local config2 = {
							eventType = "capReached",
							reason = nil,
							actionId = nil,
							slot = Entry.slotId,
							handle = Entry.handle,
							lifecycleKey = Entry.lifecycleKey,
							source = Entry.source,
							itemId = Entry.itemId,
							itemType = Entry.itemType
						}
						pcall(function()
							-- upvalues: NotificationsOrchestrator (upval), config2 (copy)
							require(NotificationsOrchestrator.Analytics.sendNotificationReportUnifiedEvent).send(config2)
						end)
					end
				end
				return
			elseif FFlagEnableNotificationsOrchestratorUnifiedLoggingModule then
				local config = {
					eventType = "suppressed",
					slot = Slot,
					lifecycleKey = LifecycleKey
				}
				pcall(function()
					-- upvalues: NotificationsOrchestrator (upval), config (copy)
					require(NotificationsOrchestrator.Analytics.sendNotificationReportUnifiedEvent).send(config)
				end)
			end
		end,
		getActiveForSlot = function(Key)
			-- upvalues: t (copy), CreateSessionScopedSignalFunction (upval)
			local Entry = t[Key]
			local Entry1 = nil
			
			if Entry == nil then
				local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(nil)
				local config = {
					getActive = SessionScopedSignal,
					setActive = SessionScopedSignal2
				}
				t[Key] = config
				Entry1 = config
			else
				Entry1 = Entry
			end
			return Entry1.getActive
		end,
		setInExperienceShopOpen = function(Value)
			-- upvalues: LocalUserIdStore (upval), CurrentUserId (ref), Tbl (copy), Tbl1 (copy), InExperienceShopOpen (ref), removeEntry (copy), FFlagEnableNotificationsOrchestratorUnifiedLoggingModule (upval), NotificationsOrchestrator (upval)
			local CurrentUserId1 = LocalUserIdStore.getCurrentUserId(false)
			
			if CurrentUserId1 ~= CurrentUserId then
				CurrentUserId = CurrentUserId1
				table.clear(Tbl)
				table.clear(Tbl1)
			end
			if InExperienceShopOpen == Value then return end
			InExperienceShopOpen = Value
			
			if not Value then return end
			local List = {}
			
			for _, value in Tbl do
				if value.suppressWhileInExperienceShopOpen then
					table.insert(List, value)
				end
			end
			for _, Active in List do
				if Tbl[Active.handle] ~= nil then
					removeEntry(Active)
					
					if FFlagEnableNotificationsOrchestratorUnifiedLoggingModule then
						local config = {
							eventType = "suppressed",
							reason = nil,
							actionId = nil,
							slot = Active.slotId,
							handle = Active.handle,
							lifecycleKey = Active.lifecycleKey,
							source = Active.source,
							itemId = Active.itemId,
							itemType = Active.itemType
						}
						pcall(function()
							-- upvalues: NotificationsOrchestrator (upval), config (copy)
							require(NotificationsOrchestrator.Analytics.sendNotificationReportUnifiedEvent).send(config)
						end)
					end
				end
			end
		end
	}
end