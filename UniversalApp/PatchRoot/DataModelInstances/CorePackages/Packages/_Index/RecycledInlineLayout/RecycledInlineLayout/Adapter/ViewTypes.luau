local RecycledInlineLayout = script:FindFirstAncestor("RecycledInlineLayout")
local Parent = RecycledInlineLayout.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local ViewRecyclerReactModule = require(Parent.ViewRecyclerReact)
local ReportSizeContextModule = require(RecycledInlineLayout.Adapter.ReportSizeContext)
local ReactiveModule = require(RecycledInlineLayout.Utils.Reactive)
local _ = require(RecycledInlineLayout.Types)
local PoolsModule = require(RecycledInlineLayout.Definitions.pools)
local UseTestIdModule = require(RecycledInlineLayout.Utils.useTestId)
local t = {}

local function _(p1, p2)
	-- upvalues: t (copy)
	local Text: string = `{p1}.{p2}`
	
	if not t[Text] then
		t[Text] = true
		warn(`RecycledInlineLayout: {Text} is delivered as state, which doesn't follow a Binding; pass a plain value or a Signal`)
	end
end

local function readState(Callback, p1)
	-- upvalues: ReactiveModule (copy)
	return if ReactiveModule.isBinding(Callback) then Callback:getValue() elseif ReactiveModule.isSignal(Callback) then Callback(p1) else Callback
end

local function sameState(p1, p2): boolean
	-- upvalues: ReactiveModule (copy), readState (copy)
	if p1.specs ~= p2.specs then
		return false
	end
	for i, spec in p1.specs do
		if spec.delivery == "state" then
			local Prop = p1.props[i]
			
			if not spec.equals(if ReactiveModule.isBinding(Prop) then Prop:getValue() elseif ReactiveModule.isSignal(Prop) then Prop(false) else Prop, readState(p2.props[i], false)) then
				return false
			end
		end
	end
	return true
end

local function createWiring(NoSplit, List)
	-- upvalues: ReactModule (copy), ReactiveModule (copy), SignalsModule (copy), sameState (copy)
	local ViewProps = {}
	local t = {}
	local Tbl = {}
	local Props = {}
	local SetSpanState = nil
	local ReportSize = nil
	local v1 = nil
	local v2 = nil
	
	local function _(p3)
		-- upvalues: t (copy), ReactModule (upval), ViewProps (copy)
		if t[p3] == nil then
			ViewProps[p3], t[p3] = ReactModule.createBinding(nil)
		end
		return t[p3]
	end
	
	local _ = function(Key)
		-- upvalues: ViewProps (copy), Props (copy)
		if ViewProps[Key] == nil then
			ViewProps[Key] = function(...)
				-- upvalues: Props (upval), Key (copy)
				local Callback = Props[Key]
				
				return if Callback == nil then nil else Callback(...)
			end
		end
	end
	
	if List ~= nil then
		for i, value in List do
			if value.delivery ~= "binding" then
				if value.delivery == "callback" and ViewProps[i] == nil then
					ViewProps[i] = function(...)
						-- upvalues: Props (copy), i (copy)
						local Callback = Props[i]
						
						return if Callback == nil then nil else Callback(...)
					end
					
					continue
				end
				continue
			end
			if t[i] == nil then
				ViewProps[i], t[i] = ReactModule.createBinding(nil)
			end
			local _ = t[i]
		end
	end
	local function forward(SpanStateName, Callback1, Callback: (any) -> (), Subscribed)
		-- upvalues: Tbl (copy), ReactiveModule (upval), ReactModule (upval), SignalsModule (upval)
		local Entry = Tbl[SpanStateName]
		
		if Entry ~= nil and Entry.raw == Callback1 and (Entry.subscribed or not Subscribed) then return end
		if Entry ~= nil and Entry.disconnect ~= nil then
			Entry.disconnect()
		end
		local Effect = nil
		
		if ReactiveModule.isBinding(Callback1) then
			Callback(Callback1:getValue())
			
			if Subscribed then
				Effect = ReactModule.__subscribeToBinding(Callback1, Callback)
			end
		elseif ReactiveModule.isSignal(Callback1) then
			if Subscribed then
				Effect = SignalsModule.createEffect(function(p3)
					-- upvalues: Callback (copy), Callback1 (copy)
					Callback(Callback1(p3))
				end)
			else
				Callback(Callback1(false))
			end
		else
			Callback(Callback1)
		end
		Tbl[SpanStateName] = {
			raw = Callback1,
			disconnect = Effect,
			subscribed = Subscribed
		}
	end
	
	local v3 = if NoSplit then function(p3)
		-- upvalues: v2 (ref), ReportSize (ref)
		v2 = p3
		
		if ReportSize ~= nil then
			ReportSize(p3)
		end
	end else nil
	
	return {
		viewProps = ViewProps,
		assign = function(ViewProps1, Subscribed)
			-- upvalues: v1 (ref), ReportSize (ref), forward (copy), t (copy), ReactModule (upval), ViewProps (copy), Props (copy), List (copy), v2 (ref), sameState (upval), SetSpanState (ref)
			local v4 = v1
			v1 = ViewProps1
			ReportSize = ViewProps1.reportSize
			
			for i, spec in ViewProps1.specs do
				local Prop = ViewProps1.props[i]
				
				if spec.delivery ~= "binding" then
					if spec.delivery == "callback" then
						Props[i] = Prop
						
						if ViewProps[i] == nil then
							ViewProps[i] = function(...)
								-- upvalues: Props (upval), i (copy)
								local Callback = Props[i]
								
								return if Callback == nil then nil else Callback(...)
							end
							
							continue
						end
						continue
					end
					continue
				end
				if t[i] == nil then
					ViewProps[i], t[i] = ReactModule.createBinding(nil)
				end
				forward(i, Prop, t[i], Subscribed)
			end
			if List ~= nil then
				for i1, value in List do
					if ViewProps1.specs[i1] == nil then
						if value.delivery == "binding" then
							local Raw = nil
							
							if t[i1] == nil then
								ViewProps[i1], t[i1] = ReactModule.createBinding(nil)
							end
							forward(i1, Raw, t[i1], Subscribed)
						elseif value.delivery == "callback" then
							Props[i1] = nil
						end
					end
				end
			end
			if ViewProps1.rows ~= nil then
				local v5 = "rows"
				local Rows = ViewProps1.rows
				
				if t.rows == nil then
					ViewProps.rows, t.rows = ReactModule.createBinding(nil)
				end
				forward(v5, Rows, t.rows, Subscribed)
			end
			if ViewProps1.reportSize ~= nil and v2 ~= nil and v4 ~= nil and v4.reportSize ~= ViewProps1.reportSize and sameState(v4, ViewProps1) then
				ViewProps1.reportSize(v2)
			end
			local SpanState = ViewProps1.spanState
			
			if SpanState ~= nil then
				local SpanState1 = ViewProps.spanState
				
				if SpanState1 == nil then
					SpanState1 = {}
					ViewProps.spanState = SpanState1
				end
				for i2, value1 in SpanState do
					local SpanStateName: string = `spanState.{i2}`
					local Entry = t[SpanStateName]
					
					if Entry == nil then
						local Binding2
						SpanState1[i2], Binding2 = ReactModule.createBinding(value1(false))
						t[SpanStateName] = Binding2
						Entry = Binding2
					end
					forward(SpanStateName, value1, Entry, Subscribed)
				end
				SetSpanState = ViewProps1.setSpanState
				
				if ViewProps.setSpanState == nil then
					function ViewProps.setSpanState(p3, p4)
						-- upvalues: SetSpanState (upval)
						if SetSpanState ~= nil then
							SetSpanState(p3, p4)
						end
					end
				end
			end
		end,
		disconnectAll = function()
			-- upvalues: ReportSize (ref), t (copy), Tbl (copy)
			ReportSize = nil
			
			if t.testId ~= nil then
				t.testId(nil)
			end
			for _, value in Tbl do
				if value.disconnect ~= nil then
					value.disconnect()
				end
			end
			table.clear(Tbl)
		end,
		getReporter = function()
			-- upvalues: v3 (copy)
			return v3
		end
	}
end

local _ = function(p3, p4): boolean
	local v6 = p3[p4]
	
	return v6 ~= nil and v6.delivery == "state"
end

local function stateEquals(p3, p4): boolean
	if p3 == nil or p4 == nil or p3.values.rowCapacity ~= p4.values.rowCapacity then
		return false
	end
	for i, spec in p3.specs do
		if spec.delivery == "state" then
			local Spec = p4.specs[i]
			
			if Spec == nil or Spec.delivery ~= "state" or not spec.equals(p3.values[i], p4.values[i]) then
				return false
			end
		end
	end
	for i1, spec1 in p4.specs do
		if spec1.delivery == "state" then
			local Spec = p3.specs[i1]
			
			if Spec == nil or Spec.delivery ~= "state" then
				return false
			end
		end
	end
	return true
end

local _ = function(p5, p6, p7)
	-- upvalues: ReactModule (copy), createWiring (copy), SignalsModule (copy), ReactiveModule (copy), t (copy), stateEquals (copy), SignalsReactModule (copy), ViewRecyclerReactModule (copy), UseTestIdModule (copy), ReportSizeContextModule (copy)
	local IsString = typeof(p5) == "string"
	
	return ViewRecyclerReactModule.createRecyclableView(function(p8)
		-- upvalues: ReactModule (upval), createWiring (upval), p6 (copy), p7 (copy), SignalsModule (upval), ReactiveModule (upval), t (upval), stateEquals (upval), SignalsReactModule (upval), ViewRecyclerReactModule (upval), IsString (copy), UseTestIdModule (upval), ReportSizeContextModule (upval), p5 (copy)
		local ItemSignalFunction = p8.itemSignal
		local UseStateResult = ReactModule.useState(function()
			-- upvalues: createWiring (upval), p6 (upval), p7 (upval), ItemSignalFunction (copy)
			local v6 = createWiring(p6, p7)
			v6.assign(ItemSignalFunction(false), false)
			
			return v6
		end)
		local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), ItemSignalFunction (copy), ReactiveModule (upval), t (upval), stateEquals (upval)
			return SignalsModule.createComputed(function(p9)
				-- upvalues: ItemSignalFunction (upval), ReactiveModule (upval), t (upval)
				local ItemSignalResult = ItemSignalFunction(p9)
				local Values = {}
				
				for i, spec in ItemSignalResult.specs do
					if spec.delivery == "state" then
						local Prop = ItemSignalResult.props[i]
						
						if spec.layout == "none" and ReactiveModule.isBinding(Prop) then
							local Text: string = `{ItemSignalResult.kind}.{i}`
							
							if not t[Text] then
								t[Text] = true
								warn(`RecycledInlineLayout: {Text} is delivered as state, which doesn't follow a Binding; pass a plain value or a Signal`)
							end
						end
						Values[i] = if ReactiveModule.isBinding(Prop) then Prop:getValue() elseif ReactiveModule.isSignal(Prop) then Prop(p9) else Prop
					end
				end
				Values.rowCapacity = ItemSignalResult.rowCapacity
				
				return { specs = ItemSignalResult.specs, values = Values }
			end, stateEquals)
		end, { ItemSignalFunction })))
		local UseRecyclingAssignmentResult = ViewRecyclerReactModule.useRecyclingAssignment()
		ReactModule.useLayoutEffect(function()
			-- upvalues: SignalsModule (upval), UseRecyclingAssignmentResult (copy), UseStateResult (copy), ItemSignalFunction (copy)
			local Effect = SignalsModule.createEffect(function(p9)
				-- upvalues: UseRecyclingAssignmentResult (upval), UseStateResult (upval), ItemSignalFunction (upval)
				if UseRecyclingAssignmentResult(p9) == nil then
					UseStateResult.disconnectAll()
					
					return
				else
					UseStateResult.assign(ItemSignalFunction(p9), true)
				end
			end)
			
			return function()
				-- upvalues: Effect (copy), UseStateResult (upval)
				Effect()
				UseStateResult.disconnectAll()
			end
		end, { ItemSignalFunction, UseRecyclingAssignmentResult })
		ReactModule.useLayoutEffect(function()
			-- upvalues: ItemSignalFunction (copy)
			local ItemSignalResult = ItemSignalFunction(false)
			
			if ItemSignalResult.diagnostics ~= nil then
				ItemSignalResult.diagnostics({
					type = "viewRender",
					kind = ItemSignalResult.kind,
					key = ItemSignalResult.key
				})
			end
		end)
		local Copy = table.clone(UseStateResult.viewProps)
		
		for i, value in UseSignalStateResult.values do
			Copy[i] = value
		end
		local UseRefResult = ReactModule.useRef(nil)
		
		if IsString then
			UseTestIdModule(Copy.testId, { UseRefResult })
			Copy.testId = nil
			Copy.ref = UseRefResult
		end
		return ReactModule.createElement(ReportSizeContextModule.Provider, { value = UseStateResult.getReporter() or false }, { View = ReactModule.createElement(p5, Copy) })
	end)
end

local self = setmetatable({}, { __mode = "k" })
local self1 = setmetatable({}, { __mode = "k" })

return {
	getViewType = function(p9)
		-- upvalues: self (copy), PoolsModule (copy), ReactModule (copy), createWiring (copy), SignalsModule (copy), ReactiveModule (copy), t (copy), stateEquals (copy), SignalsReactModule (copy), ViewRecyclerReactModule (copy), UseTestIdModule (copy), ReportSizeContextModule (copy), self1 (copy)
		local Pool = if p9.pool == nil then p9 else p9.pool
		local SelfEntry = self[Pool]
		
		if SelfEntry == nil then
			local GetResult = if p9.pool == nil then nil else PoolsModule.get(p9.pool)
			
			if GetResult == nil then
				local View1 = p9.view
				local NoSplit: boolean = p9.measure ~= nil and p9.split == nil
				local IsString1 = typeof(View1) == "string"
				local v6 = nil
				SelfEntry = ViewRecyclerReactModule.createRecyclableView(function(p10)
					-- upvalues: ReactModule (upval), createWiring (upval), NoSplit (copy), v6 (copy), SignalsModule (upval), ReactiveModule (upval), t (upval), stateEquals (upval), SignalsReactModule (upval), ViewRecyclerReactModule (upval), IsString1 (copy), UseTestIdModule (upval), ReportSizeContextModule (upval), View1 (copy)
					local ItemSignalFunction = p10.itemSignal
					local UseStateResult = ReactModule.useState(function()
						-- upvalues: createWiring (upval), NoSplit (upval), v6 (upval), ItemSignalFunction (copy)
						local v7 = createWiring(NoSplit, v6)
						v7.assign(ItemSignalFunction(false), false)
						
						return v7
					end)
					local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
						-- upvalues: SignalsModule (upval), ItemSignalFunction (copy), ReactiveModule (upval), t (upval), stateEquals (upval)
						return SignalsModule.createComputed(function(p11)
							-- upvalues: ItemSignalFunction (upval), ReactiveModule (upval), t (upval)
							local ItemSignalResult = ItemSignalFunction(p11)
							local Values = {}
							
							for i, spec in ItemSignalResult.specs do
								if spec.delivery == "state" then
									local Prop = ItemSignalResult.props[i]
									
									if spec.layout == "none" and ReactiveModule.isBinding(Prop) then
										local Text: string = `{ItemSignalResult.kind}.{i}`
										
										if not t[Text] then
											t[Text] = true
											warn(`RecycledInlineLayout: {Text} is delivered as state, which doesn't follow a Binding; pass a plain value or a Signal`)
										end
									end
									Values[i] = if ReactiveModule.isBinding(Prop) then Prop:getValue() elseif ReactiveModule.isSignal(Prop) then Prop(p11) else Prop
								end
							end
							Values.rowCapacity = ItemSignalResult.rowCapacity
							
							return { specs = ItemSignalResult.specs, values = Values }
						end, stateEquals)
					end, { ItemSignalFunction })))
					local UseRecyclingAssignmentResult = ViewRecyclerReactModule.useRecyclingAssignment()
					ReactModule.useLayoutEffect(function()
						-- upvalues: SignalsModule (upval), UseRecyclingAssignmentResult (copy), UseStateResult (copy), ItemSignalFunction (copy)
						local Effect = SignalsModule.createEffect(function(p11)
							-- upvalues: UseRecyclingAssignmentResult (upval), UseStateResult (upval), ItemSignalFunction (upval)
							if UseRecyclingAssignmentResult(p11) == nil then
								UseStateResult.disconnectAll()
								
								return
							else
								UseStateResult.assign(ItemSignalFunction(p11), true)
							end
						end)
						
						return function()
							-- upvalues: Effect (copy), UseStateResult (upval)
							Effect()
							UseStateResult.disconnectAll()
						end
					end, { ItemSignalFunction, UseRecyclingAssignmentResult })
					ReactModule.useLayoutEffect(function()
						-- upvalues: ItemSignalFunction (copy)
						local ItemSignalResult = ItemSignalFunction(false)
						
						if ItemSignalResult.diagnostics ~= nil then
							ItemSignalResult.diagnostics({
								type = "viewRender",
								kind = ItemSignalResult.kind,
								key = ItemSignalResult.key
							})
						end
					end)
					local Copy = table.clone(UseStateResult.viewProps)
					
					for i, value in UseSignalStateResult.values do
						Copy[i] = value
					end
					local UseRefResult = ReactModule.useRef(nil)
					
					if IsString1 then
						UseTestIdModule(Copy.testId, { UseRefResult })
						Copy.testId = nil
						Copy.ref = UseRefResult
					end
					return ReactModule.createElement(ReportSizeContextModule.Provider, { value = UseStateResult.getReporter() or false }, { View = ReactModule.createElement(View1, Copy) })
				end)
				self1[SelfEntry] = p9.name
			else
				local View = GetResult.view
				local Atomic = GetResult.atomic
				local Specs = GetResult.specs
				local IsString = typeof(View) == "string"
				SelfEntry = ViewRecyclerReactModule.createRecyclableView(function(p11)
					-- upvalues: ReactModule (upval), createWiring (upval), Atomic (copy), Specs (copy), SignalsModule (upval), ReactiveModule (upval), t (upval), stateEquals (upval), SignalsReactModule (upval), ViewRecyclerReactModule (upval), IsString (copy), UseTestIdModule (upval), ReportSizeContextModule (upval), View (copy)
					local ItemSignalFunction = p11.itemSignal
					local UseStateResult = ReactModule.useState(function()
						-- upvalues: createWiring (upval), Atomic (upval), Specs (upval), ItemSignalFunction (copy)
						local v7 = createWiring(Atomic, Specs)
						v7.assign(ItemSignalFunction(false), false)
						
						return v7
					end)
					local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
						-- upvalues: SignalsModule (upval), ItemSignalFunction (copy), ReactiveModule (upval), t (upval), stateEquals (upval)
						return SignalsModule.createComputed(function(p12)
							-- upvalues: ItemSignalFunction (upval), ReactiveModule (upval), t (upval)
							local ItemSignalResult = ItemSignalFunction(p12)
							local Values = {}
							
							for i, spec in ItemSignalResult.specs do
								if spec.delivery == "state" then
									local Prop = ItemSignalResult.props[i]
									
									if spec.layout == "none" and ReactiveModule.isBinding(Prop) then
										local Text: string = `{ItemSignalResult.kind}.{i}`
										
										if not t[Text] then
											t[Text] = true
											warn(`RecycledInlineLayout: {Text} is delivered as state, which doesn't follow a Binding; pass a plain value or a Signal`)
										end
									end
									Values[i] = if ReactiveModule.isBinding(Prop) then Prop:getValue() elseif ReactiveModule.isSignal(Prop) then Prop(p12) else Prop
								end
							end
							Values.rowCapacity = ItemSignalResult.rowCapacity
							
							return { specs = ItemSignalResult.specs, values = Values }
						end, stateEquals)
					end, { ItemSignalFunction })))
					local UseRecyclingAssignmentResult = ViewRecyclerReactModule.useRecyclingAssignment()
					ReactModule.useLayoutEffect(function()
						-- upvalues: SignalsModule (upval), UseRecyclingAssignmentResult (copy), UseStateResult (copy), ItemSignalFunction (copy)
						local Effect = SignalsModule.createEffect(function(p12)
							-- upvalues: UseRecyclingAssignmentResult (upval), UseStateResult (upval), ItemSignalFunction (upval)
							if UseRecyclingAssignmentResult(p12) == nil then
								UseStateResult.disconnectAll()
								
								return
							else
								UseStateResult.assign(ItemSignalFunction(p12), true)
							end
						end)
						
						return function()
							-- upvalues: Effect (copy), UseStateResult (upval)
							Effect()
							UseStateResult.disconnectAll()
						end
					end, { ItemSignalFunction, UseRecyclingAssignmentResult })
					ReactModule.useLayoutEffect(function()
						-- upvalues: ItemSignalFunction (copy)
						local ItemSignalResult = ItemSignalFunction(false)
						
						if ItemSignalResult.diagnostics ~= nil then
							ItemSignalResult.diagnostics({
								type = "viewRender",
								kind = ItemSignalResult.kind,
								key = ItemSignalResult.key
							})
						end
					end)
					local Copy = table.clone(UseStateResult.viewProps)
					
					for i, value in UseSignalStateResult.values do
						Copy[i] = value
					end
					local UseRefResult = ReactModule.useRef(nil)
					
					if IsString then
						UseTestIdModule(Copy.testId, { UseRefResult })
						Copy.testId = nil
						Copy.ref = UseRefResult
					end
					return ReactModule.createElement(ReportSizeContextModule.Provider, { value = UseStateResult.getReporter() or false }, { View = ReactModule.createElement(View, Copy) })
				end)
				self1[SelfEntry] = table.concat(GetResult.names, "+")
			end
			self[Pool] = SelfEntry
		end
		return SelfEntry
	end,
	getName = function(p11)
		-- upvalues: self1 (copy)
		return self1[p11]
	end
}