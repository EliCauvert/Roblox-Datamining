local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local CoreGui = require(Foundation.Utility.Wrappers).Services.CoreGui
local GuiService = require(Foundation.Utility.Wrappers).Services.GuiService
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local UseRefCacheFunction = require(Parent.ReactUtils).useRefCache
local IsPluginSecurityModule = require(Foundation.Utility.isPluginSecurity)
local CursorModule = require(script.Parent.Cursors.Cursor)
local CursorComponentModule = require(script.Parent.CursorComponent)
local CursorContextModule = require(script.Parent.CursorContext)
local _ = require(Foundation.Enums.CursorType)
local KeyUtilitiesModule = require(script.Parent.KeyUtilities)
local _ = require(Foundation.Enums.ColorNamespace)
local _ = require(Foundation.Components.Types)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return function(p1) --[[ Line: 28 | Named "CursorProvider" ]]
	-- upvalues: ReactModule (copy), UseRefCacheFunction (copy), UseTokensModule (copy), KeyUtilitiesModule (copy), DashModule (copy), CursorModule (copy), CursorComponentModule (copy), IsPluginSecurityModule (copy), CoreGui (copy), GuiService (copy), CursorContextModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseRefCacheResult = UseRefCacheFunction()
	local UseTokensModuleResult = UseTokensModule()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 35 ]]
		-- upvalues: UseRefCacheResult (copy), UseStateResult2 (copy), KeyUtilitiesModule (upval), UseTokensModuleResult (copy), DashModule (upval)
		return {
			refCache = UseRefCacheResult,
			setMountedCursors = UseStateResult2,
			getCursor = function(p2) --[[ Line: 39 ]]
				-- upvalues: KeyUtilitiesModule (upval), UseTokensModuleResult (upval), UseStateResult2 (upval), DashModule (upval), UseRefCacheResult (upval)
				local MapCursorToKeyResult = KeyUtilitiesModule.mapCursorToKey(p2, UseTokensModuleResult)
				UseStateResult2(function(p3) --[[ Line: 42 ]]
					-- upvalues: MapCursorToKeyResult (copy), DashModule (upval)
					return if p3[MapCursorToKeyResult] == nil then DashModule.union(p3, { [MapCursorToKeyResult] = true }) else p3
				end)
				
				return UseRefCacheResult[MapCursorToKeyResult]
			end
		}
	end, {
		UseRefCacheResult,
		UseStateResult2,
		UseTokensModuleResult
	})
	
	local function v23() --[[ Line: 56 ]]
		-- upvalues: UseStateResult (copy), UseRefCacheResult (copy), UseStateResult1 (copy), KeyUtilitiesModule (upval), ReactModule (upval), CursorModule (upval), CursorComponentModule (upval)
		local Elements = {}
		
		for i, _ in UseStateResult do
			local IsCurrentMatch: boolean = UseRefCacheResult[i] ~= nil and (UseStateResult1 ~= nil and UseRefCacheResult[i].current == UseStateResult1)
			local Parts = string.split(i, " ")
			
			if #Parts == 2 then
				local DecodeCursorTypeKeyResult, DecodeCursorTypeKeyResult2 = KeyUtilitiesModule.decodeCursorTypeKey(Parts)
				Elements[i] = ReactModule.createElement(CursorModule, {
					ref = UseRefCacheResult[i],
					isVisible = IsCurrentMatch,
					cursorType = DecodeCursorTypeKeyResult,
					colorNamespace = DecodeCursorTypeKeyResult2
				})
			else
				local DecodeKeyResult, DecodeKeyResult2, DecodeKeyResult3, DecodeKeyResult4 = KeyUtilitiesModule.decodeKey(Parts)
				Elements[i] = ReactModule.createElement(CursorComponentModule, {
					ref = UseRefCacheResult[i],
					isVisible = IsCurrentMatch,
					cornerRadius = DecodeKeyResult,
					offset = DecodeKeyResult2,
					borderWidth = DecodeKeyResult3,
					colorNamespace = DecodeKeyResult4
				})
			end
		end
		return Elements
	end
	
	ReactModule.useEffect(function() --[[ Line: 93 ]]
		-- upvalues: UseRefResult (copy), IsPluginSecurityModule (upval), CoreGui (upval), GuiService (upval), UseStateResult2_1 (copy)
		if UseRefResult.current == nil or not game:IsAncestorOf(UseRefResult.current) then return end
		local IsDescendantOf = IsPluginSecurityModule() and UseRefResult.current:IsDescendantOf(CoreGui)
		
		local function setUpSelectionImageObjectConnection() --[[ Line: 100 ]]
			-- upvalues: IsDescendantOf (copy), GuiService (upval), UseStateResult2_1 (upval)
			return if IsDescendantOf then GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 105 ]]
				-- upvalues: GuiService (upval), UseStateResult2_1 (upval)
				if GuiService.SelectedCoreObject == nil then
					UseStateResult2_1(nil)
					
					return
				else
					UseStateResult2_1(GuiService.SelectedCoreObject.SelectionImageObject)
				end
			end) else GuiService:GetPropertyChangedSignal("SelectedObject"):Connect(function() --[[ Line: 113 ]]
				-- upvalues: GuiService (upval), UseStateResult2_1 (upval)
				if GuiService.SelectedObject == nil then
					UseStateResult2_1(nil)
					
					return
				else
					UseStateResult2_1(GuiService.SelectedObject.SelectionImageObject)
				end
			end)
		end
		
		local SetUpSelectionImageObjectConnectionResult = setUpSelectionImageObjectConnection()
		local AncestryChangedConnection = UseRefResult.current.AncestryChanged:Connect(function() --[[ Line: 124 ]]
			-- upvalues: SetUpSelectionImageObjectConnectionResult (ref), setUpSelectionImageObjectConnection (copy)
			SetUpSelectionImageObjectConnectionResult:Disconnect()
			SetUpSelectionImageObjectConnectionResult = setUpSelectionImageObjectConnection()
		end)
		
		return function() --[[ Line: 134 ]]
			-- upvalues: SetUpSelectionImageObjectConnectionResult (ref), AncestryChangedConnection (copy)
			SetUpSelectionImageObjectConnectionResult:Disconnect()
			AncestryChangedConnection:Disconnect()
		end
	end, {})
	
	return ReactModule.createElement(CursorContextModule.Provider, { value = UseMemoResult }, {
		Children = ReactModule.createElement(ReactModule.Fragment, {}, p1.children),
		FoundationCursorContainer = ReactModule.createElement("Frame", {
			Visible = false,
			Size = UDim2.new(0, 0, 0, 0),
			ref = UseRefResult
		}, (v23()))
	})
end