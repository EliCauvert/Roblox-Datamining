local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(BuildExperience.Stores.GetBuildModelSelectionStore.createBuildModelSelectionStore)
local _ = require(BuildExperience.Components.ModelPicker.ModelPickerTypes)
local ExperimentOverride = require(Parent.DataHydration.CreatorAgentChat).experimentOverride
local self = setmetatable({}, { __mode = "k" })

return function(Entry, Session, RouteSessionId)
	-- upvalues: ReactModule (copy), self (copy), ExperimentOverride (copy), SignalsModule (copy), SignalsReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Session (copy), Entry (copy), UseRefResult (copy), self (upval), RouteSessionId (copy), ExperimentOverride (upval)
		local Session1 = Session or Entry
		local Current = UseRefResult.current
		local SelfEntry = if Session1 == nil then nil else self[Session1]
		
		if SelfEntry == nil and Current ~= nil and Current.entry == Entry and Current.routeSessionId == RouteSessionId and (Current.session == nil or Current.session.getCasSessionId() == nil) then
			SelfEntry = Current.pending
		end
		if SelfEntry == nil then
			local PendingKey = ExperimentOverride.createPendingKey()
			local Count = 0
			local Pending = {
				key = PendingKey,
				retain = function()
					-- upvalues: Count (ref), ExperimentOverride (upval), PendingKey (copy)
					Count += 1
					
					return function()
						-- upvalues: Count (upval), ExperimentOverride (upval), PendingKey (upval)
						Count -= 1
						
						if Count == 0 then
							ExperimentOverride.clear(PendingKey)
						end
					end
				end
			}
			
			if Session1 ~= nil then
				self[Session1] = Pending
			end
			UseRefResult.current = {
				entry = Entry,
				session = Session,
				routeSessionId = RouteSessionId,
				pending = Pending
			}
			
			return Pending
		else
			if Session1 ~= nil then
				self[Session1] = SelfEntry
			end
			UseRefResult.current = {
				entry = Entry,
				session = Session,
				routeSessionId = RouteSessionId,
				pending = SelfEntry
			}
			
			return SelfEntry
		end
	end, { Entry, Session, RouteSessionId })
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseMemoResult1 = ReactModule.useMemo(function()
		return {}
	end, { Entry, Session })
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult1 (copy), UseMemoResult1 (copy)
		UseRefResult1.current = UseMemoResult1
		
		return function()
			-- upvalues: UseRefResult1 (upval)
			UseRefResult1.current = nil
		end
	end, { UseMemoResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return UseMemoResult.retain()
	end, { UseMemoResult })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: ExperimentOverride (upval), Session (copy), UseMemoResult (copy)
		return ExperimentOverride.getKey(if Session == nil then nil else Session.getCasSessionId()) or UseMemoResult.key
	end, { Session, UseMemoResult })
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), Session (copy), ExperimentOverride (upval), UseResult (copy)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: Session (upval), ExperimentOverride (upval), UseResult (upval)
			if Session ~= nil then
				Session.getModels(p1)
			end
			return ExperimentOverride.getInternalSelection(UseResult(), p1)
		end, function(p1, p2): boolean
			return p1.isSelected == p2.isSelected and p1.previewHash == p2.previewHash
		end)
	end, { Session, UseResult })))
	
	local function _(): boolean
		-- upvalues: Entry (copy), UseRefResult1 (copy), UseMemoResult1 (copy)
		local Selection = if Entry == nil then nil else Entry.getSelection(false)
		
		return UseRefResult1.current == UseMemoResult1 and (Selection ~= nil and not Selection.isBusy)
	end
	
	local _ = function()
		-- upvalues: Session (copy), UseMemoResult (copy)
		if Session ~= nil then
			Session.setPendingExperimentKey(UseMemoResult.key)
		end
	end
	
	ReactModule.useLayoutEffect(function()
		-- upvalues: Session (copy), ExperimentOverride (upval), UseMemoResult (copy)
		if Session ~= nil and ExperimentOverride.has(UseMemoResult.key) then
			Session.setPendingExperimentKey(UseMemoResult.key)
		end
	end, { Session, UseMemoResult })
	
	return if Entry == nil then nil else {
		isSelected = UseSignalStateResult.isSelected,
		previewHash = UseSignalStateResult.previewHash,
		onSelect = function()
			-- upvalues: Entry (copy), UseRefResult1 (copy), UseMemoResult1 (copy), ExperimentOverride (upval), UseResult (copy), Session (copy), UseMemoResult (copy)
			local Selection = if Entry == nil then nil else Entry.getSelection(false)
			
			if UseRefResult1.current == UseMemoResult1 and (Selection ~= nil and not Selection.isBusy) then
				ExperimentOverride.selectInternal(UseResult(), true)
				
				if Session ~= nil then
					Session.setPendingExperimentKey(UseMemoResult.key)
				end
			end
		end,
		onSaveSpec = function(p1)
			-- upvalues: Entry (copy), UseRefResult1 (copy), UseMemoResult1 (copy), ExperimentOverride (upval), UseResult (copy), Session (copy), UseMemoResult (copy)
			local Selection = if Entry == nil then nil else Entry.getSelection(false)
			
			if UseRefResult1.current == UseMemoResult1 and (Selection ~= nil and not Selection.isBusy) and ExperimentOverride.getInternalSelection(UseResult(), false).isSelected then
				ExperimentOverride.set(UseResult(), p1)
				ExperimentOverride.selectInternal(UseResult(), true)
				
				if Session ~= nil then
					Session.setPendingExperimentKey(UseMemoResult.key)
				end
			end
		end,
		onExit = function()
			-- upvalues: Entry (copy), UseRefResult1 (copy), UseMemoResult1 (copy), ExperimentOverride (upval), UseResult (copy), Session (copy), UseMemoResult (copy)
			local Selection = if Entry == nil then nil else Entry.getSelection(false)
			
			if UseRefResult1.current == UseMemoResult1 and (Selection ~= nil and not Selection.isBusy) and ExperimentOverride.getInternalSelection(UseResult(), false).isSelected then
				ExperimentOverride.selectInternal(UseResult(), false)
				
				if Session ~= nil then
					Session.setPendingExperimentKey(UseMemoResult.key)
				end
			end
		end
	}, UseMemoResult.key
end