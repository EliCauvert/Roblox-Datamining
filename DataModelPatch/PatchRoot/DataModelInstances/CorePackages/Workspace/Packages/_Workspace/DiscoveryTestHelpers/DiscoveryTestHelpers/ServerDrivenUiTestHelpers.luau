local DiscoveryTestHelpers = script:FindFirstAncestor("DiscoveryTestHelpers")
local Parent = DiscoveryTestHelpers.Parent
local SignalsModule = require(Parent.Signals)
local CryoModule = require(Parent.Cryo)
local PromiseModule = require(Parent.Promise)
local TutilsModule = require(Parent.tutils)
local RhodiumModule = require(Parent.Rhodium)
local VirtualInput = RhodiumModule.VirtualInput
local ReactRobloxModule = require(Parent.ReactRoblox)
local Localization = require(Parent.RobloxAppLocales).Localization
local MockTokensModule = require(script.Parent.MockTokens)

local function deepJoin(p1, p2)
	-- upvalues: TutilsModule (copy), deepJoin (copy)
	if not p1 then
		return p2
	end
	local DeepCopyResult = TutilsModule.deepCopy(p1)
	
	for i, value in p2 or {} do
		if typeof(value) == "table" then
			DeepCopyResult[i] = deepJoin(DeepCopyResult[i], value)
		else
			DeepCopyResult[i] = value
		end
	end
	return DeepCopyResult
end

local function mockComponentDefinitions()
	-- upvalues: Parent (copy)
	local Jest = require(Parent.Dev.JestGlobals).jest
	local t = {}
	
	return {
		getComponentDefinition = Jest.fn(function(_, p3)
			-- upvalues: t (copy)
			return t[p3]
		end),
		getComponent = Jest.fn(function(_, p3)
			-- upvalues: t (copy)
			return t[p3] and t[p3].component
		end),
		getPropParsers = Jest.fn(function(_, p3)
			-- upvalues: t (copy)
			return t[p3] and t[p3].propParsers
		end),
		getPropInterface = Jest.fn(function(_, p3)
			-- upvalues: t (copy)
			return t[p3] and t[p3].propInterface
		end),
		doesParserRequireRenderContext = Jest.fn(function(_, p3)
			-- upvalues: t (copy)
			return t[p3] and t[p3].doesParserRequireRenderContext
		end),
		registerComponent = Jest.fn(function(_, Key, p3)
			-- upvalues: t (copy)
			t[Key] = p3
		end)
	}
end

local function mockDataStore(p3)
	-- upvalues: SignalsModule (copy), deepJoin (copy)
	return (deepJoin({
		social = { getInGameFriendsByGame = SignalsModule.createSignal({}) }
	}, p3))
end

local function mockSduiDependencies(JoinResult)
	-- upvalues: Parent (copy), CryoModule (copy), PromiseModule (copy), Localization (copy), MockTokensModule (copy)
	local Jest = require(Parent.Dev.JestGlobals).jest
	local config = { navigate = Jest.fn() }
	
	return CryoModule.Dictionary.join({
		dispatch = Jest.fn(),
		getNavigation = Jest.fn(function()
			-- upvalues: config (copy)
			return config
		end),
		gameAnalytics = { sendEventDeferred = Jest.fn() },
		eventIngest = { sendEventDeferred = Jest.fn() },
		logger = {
			reportError = Jest.fn(),
			reportCounter = Jest.fn(),
			reportTimers = Jest.fn()
		},
		linkingProtocol = {
			detectURL = Jest.fn(),
			isURLRegistered = Jest.fn(function(_, p3)
				-- upvalues: PromiseModule (upval)
				return PromiseModule.resolve(p3 == "roblox://registered-with-mock/")
			end),
			openURL = Jest.fn(function(_, _)
				-- upvalues: PromiseModule (upval)
				return PromiseModule.resolve()
			end)
		},
		instrumentation = {
			startTimerFlow = Jest.fn(function() end),
			stopTimerFlow = Jest.fn(function() end),
			reportTimers = Jest.fn()
		},
		localization = Localization.new("en-us"),
		tokens = MockTokensModule(1),
		cursors = { tileCursor = nil }
	}, JoinResult or {})
end

local function mockSduiContext(JoinResult, p3)
	-- upvalues: Parent (copy), SignalsModule (copy), CryoModule (copy), mockSduiDependencies (copy), mockComponentDefinitions (copy), mockDataStore (copy)
	local Jest = require(Parent.Dev.JestGlobals).jest
	local Signal = SignalsModule.createSignal({
		numColumns = 3,
		fractionalItemAmount = 0,
		columnGap = 24,
		sideMargin = 24,
		verticalPadding = 16
	})
	
	return CryoModule.Dictionary.join({
		appPage = "Home",
		dataUpdatedTimestamp = os.clock(),
		dependencies = mockSduiDependencies(p3),
		buildSduiComponent = function()
			return nil
		end,
		componentDefinitions = mockComponentDefinitions(),
		templateRegistry = {
			shouldResolveTemplate = Jest.fn(),
			resolveTemplateForConfig = Jest.fn()
		},
		dataStore = mockDataStore(),
		getPageLayoutConfig = function(_)
			-- upvalues: SignalsModule (upval), Signal (copy)
			return SignalsModule.createComputed(function(p4)
				-- upvalues: Signal (upval)
				return Signal(p4)
			end)
		end
	}, JoinResult or {})
end

local function debugDumpInstanceTreeRecursive(Object, Text)
	-- upvalues: debugDumpInstanceTreeRecursive (copy)
	if not Object then return end
	assert(Object, "node must exist")
	local Text1 = Text .. " "
	
	for _, child in Object:GetChildren() do
		local v1 = ""
		
		for _, tag in child:GetTags() do
			if string.find(tag, "data") ~= nil then
				v1 = tag
			end
		end
		print(`{Text1}{child} - testId: {v1} - {child:GetFullName()}`)
		debugDumpInstanceTreeRecursive(child, Text1)
	end
end

return {
	mockSduiDependencies = mockSduiDependencies,
	mockSduiContext = mockSduiContext,
	mockSduiContextAndLogErrors = function(p3)
		-- upvalues: mockSduiDependencies (copy), CryoModule (copy), mockSduiContext (copy)
		local P27 = p3 or {}
		assert(P27, "overrides must exist")
		local List = {}
		local List1 = {}
		local List2 = {}
		local Logger = {
			reportError = function(ErrorType, ErrorDimensions)
				-- upvalues: List (copy)
				table.insert(List, { errorType = ErrorType, errorDimensions = ErrorDimensions })
			end,
			reportCounter = function(CounterName, ErrorDimensions)
				-- upvalues: List1 (copy)
				table.insert(List1, {
					counterName = CounterName,
					errorDimensions = ErrorDimensions
				})
			end,
			reportTimers = function(Tbl)
				-- upvalues: List2 (copy)
				table.insert(List2, table.clone(Tbl))
			end
		}
		
		return {
			sduiContext = mockSduiContext(CryoModule.Dictionary.join(P27, {
				dependencies = if P27.dependencies then mockSduiDependencies(CryoModule.Dictionary.join({ logger = Logger }, P27.dependencies)) else mockSduiDependencies({ logger = Logger })
			})),
			getErrors = function()
				-- upvalues: List (copy)
				return List
			end,
			getLastError = function()
				-- upvalues: List (copy)
				return List[#List]
			end,
			hasError = function(ErrorType): boolean
				-- upvalues: List (copy)
				for _, value in List do
					if value.errorType == ErrorType then
						return true
					end
				end
				return false
			end,
			getCounters = function()
				-- upvalues: List1 (copy)
				return List1
			end,
			getLastCounter = function()
				-- upvalues: List1 (copy)
				return List1[#List1]
			end,
			hasCounter = function(CounterName): boolean
				-- upvalues: List1 (copy)
				for _, value in List1 do
					if value.counterName == CounterName then
						return true
					end
				end
				return false
			end,
			getTimerReports = function()
				-- upvalues: List2 (copy)
				return List2
			end,
			getLastTimerReport = function()
				-- upvalues: List2 (copy)
				return List2[#List2]
			end,
			hasTimer = function(p4): boolean
				-- upvalues: List2 (copy)
				for _, value in List2 do
					for i, _ in value do
						if i == p4 then
							return true
						end
					end
				end
				return false
			end,
			getTimer = function(p5)
				-- upvalues: List2 (copy)
				for _, value in List2 do
					for i, value1 in value do
						if i == p5 then
							return value1
						end
					end
				end
				return nil
			end
		}
	end,
	mockDataStore = mockDataStore,
	mockComponentDefinitions = mockComponentDefinitions,
	findInstanceWithTag = function(Object, Tag)
		for _, descendant in Object:GetDescendants() do
			if descendant:HasTag(Tag) then
				return descendant
			end
		end
		return nil
	end,
	findAndClickInstanceWithTag = function(Object, Tag)
		-- upvalues: RhodiumModule (copy), ReactRobloxModule (copy), VirtualInput (copy)
		local v2 = nil
		
		for _, descendant in Object:GetDescendants() do
			if descendant:HasTag(Tag) then
				v2 = descendant
				break
			end
		end
		assert(v2, "instance should be rendered")
		local NewResult = RhodiumModule.Element.new(v2)
		ReactRobloxModule.act(function()
			-- upvalues: NewResult (copy), VirtualInput (upval)
			NewResult:click()
			VirtualInput.waitForInputEventsProcessed()
		end)
	end,
	findAndSelectInstanceWithTag = function(Object, Tag)
		-- upvalues: ReactRobloxModule (copy), VirtualInput (copy)
		local SelectedCoreObject = nil
		
		for _, descendant in Object:GetDescendants() do
			if descendant:HasTag(Tag) then
				SelectedCoreObject = descendant
				break
			end
		end
		assert(SelectedCoreObject, "instance should be rendered")
		ReactRobloxModule.act(function()
			-- upvalues: SelectedCoreObject (copy), VirtualInput (upval)
			game:GetService("GuiService").SelectedCoreObject = SelectedCoreObject
			VirtualInput.waitForInputEventsProcessed()
		end)
	end,
	findAndMouseOverInstanceWithTag = function(Object, Tag)
		-- upvalues: RhodiumModule (copy), ReactRobloxModule (copy), VirtualInput (copy)
		local v3 = nil
		
		for _, descendant in Object:GetDescendants() do
			if descendant:HasTag(Tag) then
				v3 = descendant
				break
			end
		end
		assert(v3, "instance should be rendered")
		local NewResult = RhodiumModule.Element.new(v3)
		ReactRobloxModule.act(function()
			-- upvalues: VirtualInput (upval), NewResult (copy)
			VirtualInput.waitForInputEventsProcessed()
			VirtualInput.Mouse.mouseMove(NewResult:getAnchor())
			VirtualInput.waitForInputEventsProcessed()
		end)
	end,
	findDescendantWithImage = function(Object, Image)
		for _, descendant in Object:GetDescendants() do
			if (descendant:IsA("ImageLabel") or descendant:IsA("ImageButton")) and descendant.Image == Image then
				return descendant
			end
		end
		return nil
	end,
	findDescendantWithText = function(Object, p6)
		for _, descendant in Object:GetDescendants() do
			if (descendant:IsA("TextLabel") or descendant:IsA("TextButton")) and descendant.Text == p6 then
				return descendant
			end
		end
		return nil
	end,
	mountSduiComponent = function(TestComponent, ChildName)
		-- upvalues: DiscoveryTestHelpers (copy), Parent (copy)
		local VirtualInput = require(Parent.Rhodium).VirtualInput
		local v4 = require(DiscoveryTestHelpers.mountInScreenGui)({
			TestWrapper = require(DiscoveryTestHelpers.wrapWithAppProviders)({ TestComponent = TestComponent })
		}, ChildName)
		require(Parent.ReactRoblox).act(function()
			-- upvalues: VirtualInput (copy)
			VirtualInput.waitForInputEventsProcessed()
		end)
		local ChildName1 = game:GetService("CoreGui"):FindFirstChild(ChildName)
		assert(ChildName1, `ScreenGui {ChildName} should be mounted`)
		
		return ChildName1, v4
	end,
	debugDumpInstanceTree = function(p7)
		-- upvalues: debugDumpInstanceTreeRecursive (copy)
		print("\n\t----------- DEBUG DUMP TREE -------------")
		debugDumpInstanceTreeRecursive(p7, "")
		print("\t-----------------------------------------\n\n\t")
	end
}