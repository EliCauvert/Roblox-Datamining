local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local flagsModule = require(foundation.Utility.Flags)
local coreGui = require(foundation.Utility.Wrappers).Services.CoreGui
local guiService = require(foundation.Utility.Wrappers).Services.GuiService
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local useRefCache = require(parent.ReactUtils).useRefCache
local isPluginSecurityModule = require(foundation.Utility.isPluginSecurity)
local cursorModule = require(script.Parent.Cursors.Cursor)
local cursorComponentModule = require(script.Parent.CursorComponent)
local cursorContextModule = require(script.Parent.CursorContext)
local _ = require(foundation.Enums.CursorType)
local keyUtilitiesModule = require(script.Parent.KeyUtilities)
local _ = require(foundation.Enums.ColorMode)
local _ = require(foundation.Components.Types)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return function(p0) --[[ line: 29 | named "CursorProvider" ]]
	-- upvalues: reactModule (ref), useRefCache (ref), useTokensModule (ref), keyUtilitiesModule (ref), dashModule (ref), cursorModule (ref), cursorComponentModule (ref), flagsModule (ref), isPluginSecurityModule (ref), coreGui (ref), guiService (ref), cursorContextModule (ref)
	local var10, var11 = reactModule.useState({})
	local var12 = reactModule.useRef(nil)
	local var13, var14 = reactModule.useState(nil)
	local var15 = useRefCache()
	local var16 = useTokensModule()
	local var17 = reactModule.useMemo(function() --[[ line: 36 ]]
		-- upvalues: var15 (ref), var11 (ref), keyUtilitiesModule (copy), var16 (ref), dashModule (copy)
		return {
			refCache = var15,
			setMountedCursors = var11,
			getCursor = function(p1) --[[ line: 40 ]]
				-- upvalues: keyUtilitiesModule (copy), var16 (copy), var11 (copy), dashModule (copy), var15 (copy)
				local var19 = keyUtilitiesModule.mapCursorToKey(p1, var16)
				var11(function(p2) --[[ line: 43 ]]
					-- upvalues: var19 (ref), dashModule (copy)
					return if p2[var19] == nil then dashModule.union(p2, { [var19] = true }) else p2
				end)
				
				return var15[var19]
			end
		}
	end, { var15, var11, var16 })
	
	local var18 = function() --[[ line: 57 ]]
		-- upvalues: var10 (ref), var15 (ref), var13 (ref), keyUtilitiesModule (copy), reactModule (copy), cursorModule (copy), cursorComponentModule (copy)
		local t = {}
		
		for i, v in var10 do
			local var21 = var15[i] ~= nil and (var13 ~= nil and var15[i].current == var13)
			local parts = string.split(i, " ")
			
			if #parts == 2 then
				local var27, var28 = keyUtilitiesModule.decodeCursorTypeKey(parts)
				t[i] = reactModule.createElement(cursorModule, {
					ref = var15[i],
					isVisible = var21,
					cursorType = var27,
					colorMode = var28
				})
			else
				local var23, var24, var25, var26 = keyUtilitiesModule.decodeKey(parts)
				t[i] = reactModule.createElement(cursorComponentModule, {
					ref = var15[i],
					isVisible = var21,
					cornerRadius = var23,
					offset = var24,
					borderWidth = var25,
					colorMode = var26
				})
			end
		end
		return t
	end
	
	reactModule.useEffect(function() --[[ line: 94 ]]
		-- upvalues: var12 (ref), flagsModule (copy), isPluginSecurityModule (copy), coreGui (copy), guiService (copy), var14 (ref)
		if var12.current == nil or (if flagsModule.FoundationAllowMockDataModel then not game:IsAncestorOf(var12.current) else not var12.current:IsDescendantOf(game)) then
			return
		end
		local var29 = isPluginSecurityModule() and var12.current:IsDescendantOf(coreGui)
		
		local function setUpSelectionImageObjectConnection() --[[ line: 108 ]]
			-- upvalues: var29 (ref), guiService (copy), var14 (copy)
			return if var29 then guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ line: 113 ]]
				-- upvalues: guiService (copy), var14 (copy)
				if guiService.SelectedCoreObject == nil then
					var14(nil)
					
					return
				end
				var14(guiService.SelectedCoreObject.SelectionImageObject)
			end) else guiService:GetPropertyChangedSignal("SelectedObject"):Connect(function() --[[ line: 121 ]]
				-- upvalues: guiService (copy), var14 (copy)
				if guiService.SelectedObject == nil then
					var14(nil)
					
					return
				end
				var14(guiService.SelectedObject.SelectionImageObject)
			end)
		end
		
		local var31 = setUpSelectionImageObjectConnection()
		local ancestryChangedConnection = var12.current.AncestryChanged:Connect(function() --[[ line: 132 ]]
			-- upvalues: var31 (write), setUpSelectionImageObjectConnection (ref)
			var31:Disconnect()
			var31 = setUpSelectionImageObjectConnection()
		end)
		
		return function() --[[ line: 142 ]]
			-- upvalues: var31 (write), ancestryChangedConnection (ref)
			var31:Disconnect()
			ancestryChangedConnection:Disconnect()
		end
	end, {})
	
	return reactModule.createElement(cursorContextModule.Provider, { value = var17 }, {
		Children = reactModule.createElement(reactModule.Fragment, {}, p0.children),
		FoundationCursorContainer = reactModule.createElement("Frame", {
			Visible = false,
			Size = UDim2.new(0, 0, 0, 0),
			ref = var12
		}, var18())
	})
end