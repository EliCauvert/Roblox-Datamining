local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ViewRecyclerModule = require(Parent.ViewRecycler)
local SignalsReactModule = require(Parent.SignalsReact)
local SignalsModule = require(Parent.Signals)
local SizingModule = require(script.Parent.Sizing)
local BubbleItemFrameModule = require(script.Parent.Bubble.BubbleItemFrame)
local MessageBubbleItemModule = require(script.Parent.Bubble.MessageBubbleItem)
local InlineItemFrameModule = require(script.Parent.Inline.InlineItemFrame)
local MessageInlineItemModule = require(script.Parent.Inline.MessageInlineItem)
local SystemItemModule = require(script.Parent.SystemItem)
local TimestampItemModule = require(script.Parent.TimestampItem)
local GroupMessagesModule = require(script.Parent.groupMessages)
local IsScrollInputModule = require(script.Parent.isScrollInput)
local ProjectMessageEnvelopeModule = require(script.Parent.projectMessageEnvelope)
local UseMessageListLayoutModule = require(script.Parent.useMessageListLayout)
local UsePropSignalModule = require(ChatUIPrimitives.Hooks.usePropSignal)
local _ = require(script.Parent.Parent.Types)
local CreateResult = ViewRecyclerModule.ChatPreset.create()

local function getRowKey(p1)
	return p1.id
end

local config = {
	hideWhilePending = true,
	readiness = ViewRecyclerModule.RecyclableViewReadiness.ReadyOnCommit
}

local function _(p1, p2)
	-- upvalues: ViewRecyclerModule (copy), ReactModule (copy), config (copy)
	return (ViewRecyclerModule.createRecyclableView(function(p3)
		-- upvalues: ReactModule (upval), p2 (copy), p1 (copy)
		return ReactModule.createElement(p2, {}, {
			Item = ReactModule.createElement(p1, { itemSignal = p3.itemSignal })
		})
	end, config))
end

local function HeaderFrame(p1)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
end

local config1 = { kind = "header", id = "$header" }
local config2 = { kind = "endSpacer", id = "$endSpacer" }
local Component = require(script.Parent.HeaderItem).Component
local RecyclableView = ViewRecyclerModule.createRecyclableView(function(p1)
	-- upvalues: ReactModule (copy), HeaderFrame (copy), Component (copy)
	return ReactModule.createElement(HeaderFrame, {}, {
		Item = ReactModule.createElement(Component, { itemSignal = p1.itemSignal })
	})
end, config)
local config3 = {
	inline = {
		message = ViewRecyclerModule.createRecyclableView(function(p1)
			-- upvalues: ReactModule (copy), InlineItemFrameModule (copy), MessageInlineItemModule (copy)
			return ReactModule.createElement(InlineItemFrameModule, {}, {
				Item = ReactModule.createElement(MessageInlineItemModule, { itemSignal = p1.itemSignal })
			})
		end, config),
		timestamp = ViewRecyclerModule.createRecyclableView(function(p1)
			-- upvalues: ReactModule (copy), InlineItemFrameModule (copy), TimestampItemModule (copy)
			return ReactModule.createElement(InlineItemFrameModule, {}, {
				Item = ReactModule.createElement(TimestampItemModule, { itemSignal = p1.itemSignal })
			})
		end, config),
		system = ViewRecyclerModule.createRecyclableView(function(p1)
			-- upvalues: ReactModule (copy), InlineItemFrameModule (copy), SystemItemModule (copy)
			return ReactModule.createElement(InlineItemFrameModule, {}, {
				Item = ReactModule.createElement(SystemItemModule, { itemSignal = p1.itemSignal })
			})
		end, config),
		header = RecyclableView
	},
	bubble = {
		message = ViewRecyclerModule.createRecyclableView(function(p1)
			-- upvalues: ReactModule (copy), BubbleItemFrameModule (copy), MessageBubbleItemModule (copy)
			return ReactModule.createElement(BubbleItemFrameModule, {}, {
				Item = ReactModule.createElement(MessageBubbleItemModule, { itemSignal = p1.itemSignal })
			})
		end, config),
		timestamp = ViewRecyclerModule.createRecyclableView(function(p1)
			-- upvalues: ReactModule (copy), BubbleItemFrameModule (copy), TimestampItemModule (copy)
			return ReactModule.createElement(BubbleItemFrameModule, {}, {
				Item = ReactModule.createElement(TimestampItemModule, { itemSignal = p1.itemSignal })
			})
		end, config),
		system = ViewRecyclerModule.createRecyclableView(function(p1)
			-- upvalues: ReactModule (copy), BubbleItemFrameModule (copy), SystemItemModule (copy)
			return ReactModule.createElement(BubbleItemFrameModule, {}, {
				Item = ReactModule.createElement(SystemItemModule, { itemSignal = p1.itemSignal })
			})
		end, config),
		header = RecyclableView,
		endSpacer = ViewRecyclerModule.createRecyclableView(function()
			-- upvalues: ReactModule (copy), FoundationModule (copy)
			return ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-200",
				testId = "message-list-end-spacer"
			})
		end, config)
	}
}

return function(p1)
	-- upvalues: ReactModule (copy), SignalsModule (copy), ProjectMessageEnvelopeModule (copy), UsePropSignalModule (copy), GroupMessagesModule (copy), SignalsReactModule (copy), config3 (copy), UseMessageListLayoutModule (copy), SizingModule (copy), IsScrollInputModule (copy), config1 (copy), config2 (copy), getRowKey (copy), CreateResult (copy), ViewRecyclerModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), p1 (copy), ProjectMessageEnvelopeModule (upval)
		local t = {}
		
		return SignalsModule.createComputed(function(p2)
			-- upvalues: p1 (upval), t (ref), ProjectMessageEnvelopeModule (upval)
			local t1 = {}
			local List = {}
			
			for _, Source in p1.getMessageEnvelopes(p2) do
				local Entry = t[Source.stableId]
				local ProjectMessageEnvelopeModuleResult = if Entry == nil or Entry.source ~= Source then ProjectMessageEnvelopeModule(Source) else Entry.rendered
				t1[Source.stableId] = {
					source = Source,
					rendered = ProjectMessageEnvelopeModuleResult
				}
				table.insert(List, ProjectMessageEnvelopeModuleResult)
			end
			t = t1
			
			return List
		end)
	end, { p1.getMessageEnvelopes })
	local UsePropSignalModuleResult = UsePropSignalModule(p1.maxGroupSize)
	local UsePropSignalModuleResult1 = UsePropSignalModule(p1.maxGroupGapMs)
	local UsePropSignalModuleResult2 = UsePropSignalModule(p1.groupingEnabled)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseMemoResult (copy), UsePropSignalModuleResult2 (copy), GroupMessagesModule (upval), UsePropSignalModuleResult (copy), UsePropSignalModuleResult1 (copy)
		local t = {}
		
		return SignalsModule.createComputed(function(p2)
			-- upvalues: UseMemoResult (upval), UsePropSignalModuleResult2 (upval), GroupMessagesModule (upval), t (ref), UsePropSignalModuleResult (upval), UsePropSignalModuleResult1 (upval)
			local UseMemoResultResult = UseMemoResult(p2)
			local UngroupedRowsResult = if UsePropSignalModuleResult2(p2) == false then GroupMessagesModule.ungroupedRows(UseMemoResultResult, t) else GroupMessagesModule.groupMessages(UseMemoResultResult, UsePropSignalModuleResult(p2), UsePropSignalModuleResult1(p2), t)
			t = UngroupedRowsResult
			
			return UngroupedRowsResult
		end)
	end, {
		UseMemoResult,
		UsePropSignalModuleResult,
		UsePropSignalModuleResult1,
		UsePropSignalModuleResult2
	})))
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: config3 (upval), p1 (copy)
		local Entry = config3[p1.displayMode]
		
		if Entry == nil then
			error("Invalid display mode: " .. p1.displayMode)
		end
		local Entry1 = Entry[p2.kind]
		
		if Entry1 == nil then
			error("Invalid row kind: " .. p2.kind)
		end
		return Entry1
	end, { p1.displayMode })
	local UseMessageListLayoutModuleResult = UseMessageListLayoutModule()
	local UseMeasuredResult = SizingModule.useMeasured()
	local UseResolvedSizingResult = SizingModule.useResolvedSizing(if UseMeasuredResult then UseMeasuredResult.density else "regular", if UseMeasuredResult then UseMeasuredResult.widthUnits else 1)
	local ScrollBarThickness = UseResolvedSizingResult.list.scrollBarThickness
	local OnUserScrollInputFunction = p1.onUserScrollInput
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: ScrollBarThickness (copy), OnUserScrollInputFunction (copy), ReactModule (upval), IsScrollInputModule (upval)
		local config = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = ScrollBarThickness,
			VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
		}
		
		if OnUserScrollInputFunction ~= nil then
			config[ReactModule.Event.InputBegan] = function(_, p2)
				-- upvalues: IsScrollInputModule (upval), OnUserScrollInputFunction (copy)
				if IsScrollInputModule(p2, false) then
					OnUserScrollInputFunction()
				end
			end
			
			config[ReactModule.Event.InputChanged] = function(_, p2)
				-- upvalues: IsScrollInputModule (upval), OnUserScrollInputFunction (copy)
				if IsScrollInputModule(p2, true) then
					OnUserScrollInputFunction()
				end
			end
		end
		return config
	end, { ScrollBarThickness, OnUserScrollInputFunction })
	local HasHeader = p1.header ~= nil
	local IsBubble = p1.displayMode == "bubble"
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy), HasHeader (copy), IsBubble (copy), config1 (upval), config2 (upval), getRowKey (upval)
		local Copy = if HasHeader or IsBubble then table.clone(UseSignalStateResult) else UseSignalStateResult
		
		if HasHeader then
			table.insert(Copy, 1, config1)
		end
		if IsBubble then
			table.insert(Copy, config2)
		end
		return { items = Copy, getItemKey = getRowKey }
	end, { UseSignalStateResult, HasHeader, IsBubble })
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult1 = ReactModule.useRef(p1.initialScrollPosition)
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: CreateResult (upval), UseRefResult1 (copy), ViewRecyclerModule (upval), UseRefResult (copy), UseStateResult2 (copy), UseMemoResult1 (copy), UseMemoResult2 (copy), UseMessageListLayoutModuleResult (copy), UseResult (copy)
		local Copy = table.clone(CreateResult)
		
		if UseRefResult1.current == "start" then
			Copy.initialScrollAlignment = ViewRecyclerModule.ScrollAlignment.Start
		end
		Copy.listRef = UseRefResult
		Copy.scrollingFrameRef = UseStateResult2
		Copy.scrollingFrameProps = UseMemoResult1
		Copy.data = UseMemoResult2
		Copy.layout = UseMessageListLayoutModuleResult
		Copy.axis = ViewRecyclerModule.Axis.Y
		Copy.itemType = UseResult
		
		return Copy
	end, {
		UseMemoResult2,
		UseMessageListLayoutModuleResult,
		UseResult,
		UseMemoResult1
	})
	local UseRefResult2 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseRefResult2 (copy), UseRefResult1 (copy)
		local Current = UseRefResult.current
		
		if UseRefResult2.current or Current == nil then return end
		UseRefResult2.current = true
		
		if UseRefResult1.current == "start" then
			Current.scrollToStart()
			
			return
		end
	end, { UseStateResult })
	local OnCanvasPositionChangedFunction = p1.onCanvasPositionChanged
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), OnCanvasPositionChangedFunction (copy)
		if UseStateResult == nil or OnCanvasPositionChangedFunction == nil then
			return nil
		else
			local function report()
				-- upvalues: OnCanvasPositionChangedFunction (copy), UseStateResult (copy)
				OnCanvasPositionChangedFunction(UseStateResult.CanvasPosition)
			end
			
			OnCanvasPositionChangedFunction(UseStateResult.CanvasPosition)
			local Connection = UseStateResult:GetPropertyChangedSignal("CanvasPosition"):Connect(report)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end
	end, { UseStateResult, OnCanvasPositionChangedFunction })
	
	return {
		sizing = UseResolvedSizingResult,
		isMeasured = UseMeasuredResult ~= nil,
		listProps = UseMemoResult3
	}
end