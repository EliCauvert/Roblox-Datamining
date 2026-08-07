-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:26 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
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
local _ = require(foundation.Enums.ColorNamespace)
local _ = require(foundation.Components.Types)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return function(p0) --[[ line: 28 | named "CursorProvider" ]]
	-- upvalues: reactModule (ref), useRefCache (ref), useTokensModule (ref), keyUtilitiesModule (ref), dashModule (ref), cursorModule (ref), cursorComponentModule (ref), isPluginSecurityModule (ref), coreGui (ref), guiService (ref), cursorContextModule (ref)
	local var9, var10 = reactModule.useState({})
	local var11 = reactModule.useRef(nil)
	local var12, var13 = reactModule.useState(nil)
	local var14 = useRefCache()
	local var15 = useTokensModule()
	local var16 = reactModule.useMemo(function() --[[ line: 35 ]]
		-- upvalues: var14 (ref), var10 (ref), keyUtilitiesModule (copy), var15 (ref), dashModule (copy)
		return {
			refCache = var14,
			setMountedCursors = var10,
			getCursor = function(p1) --[[ line: 39 ]]
				-- upvalues: keyUtilitiesModule (copy), var15 (copy), var10 (copy), dashModule (copy), var14 (copy)
				local var18 = keyUtilitiesModule.mapCursorToKey(p1, var15)
				var10(function(p2) --[[ line: 42 ]]
					-- upvalues: var18 (ref), dashModule (copy)
					return if p2[var18] == nil then dashModule.union(p2, { [var18] = true }) else p2
				end)
				
				return var14[var18]
			end
		}
	end, { var14, var10, var15 })
	
	local var17 = function() --[[ line: 56 ]]
		-- upvalues: var9 (ref), var14 (ref), var12 (ref), keyUtilitiesModule (copy), reactModule (copy), cursorModule (copy), cursorComponentModule (copy)
		local t = {}
		
		for i, v in var9 do
			local var20 = var14[i] ~= nil and (var12 ~= nil and var14[i].current == var12)
			local parts = string.split(i, " ")
			
			if #parts == 2 then
				local var26, var27 = keyUtilitiesModule.decodeCursorTypeKey(parts)
				t[i] = reactModule.createElement(cursorModule, {
					ref = var14[i],
					isVisible = var20,
					cursorType = var26,
					colorNamespace = var27
				})
			else
				local var22, var23, var24, var25 = keyUtilitiesModule.decodeKey(parts)
				t[i] = reactModule.createElement(cursorComponentModule, {
					ref = var14[i],
					isVisible = var20,
					cornerRadius = var22,
					offset = var23,
					borderWidth = var24,
					colorNamespace = var25
				})
			end
		end
		return t
	end
	
	reactModule.useEffect(function() --[[ line: 93 ]]
		-- upvalues: var11 (ref), isPluginSecurityModule (copy), coreGui (copy), guiService (copy), var13 (ref)
		if var11.current == nil or not game:IsAncestorOf(var11.current) then
			return
		end
		local var28 = isPluginSecurityModule() and var11.current:IsDescendantOf(coreGui)
		
		local function setUpSelectionImageObjectConnection() --[[ line: 100 ]]
			-- upvalues: var28 (ref), guiService (copy), var13 (copy)
			return if var28 then guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ line: 105 ]]
				-- upvalues: guiService (copy), var13 (copy)
				if guiService.SelectedCoreObject == nil then
					var13(nil)
					
					return
				end
				var13(guiService.SelectedCoreObject.SelectionImageObject)
			end) else guiService:GetPropertyChangedSignal("SelectedObject"):Connect(function() --[[ line: 113 ]]
				-- upvalues: guiService (copy), var13 (copy)
				if guiService.SelectedObject == nil then
					var13(nil)
					
					return
				end
				var13(guiService.SelectedObject.SelectionImageObject)
			end)
		end
		
		local var30 = setUpSelectionImageObjectConnection()
		local ancestryChangedConnection = var11.current.AncestryChanged:Connect(function() --[[ line: 124 ]]
			-- upvalues: var30 (write), setUpSelectionImageObjectConnection (ref)
			var30:Disconnect()
			var30 = setUpSelectionImageObjectConnection()
		end)
		
		return function() --[[ line: 134 ]]
			-- upvalues: var30 (write), ancestryChangedConnection (ref)
			var30:Disconnect()
			ancestryChangedConnection:Disconnect()
		end
	end, {})
	
	return reactModule.createElement(cursorContextModule.Provider, { value = var16 }, {
		Children = reactModule.createElement(reactModule.Fragment, {}, p0.children),
		FoundationCursorContainer = reactModule.createElement("Frame", {
			Visible = false,
			Size = UDim2.new(0, 0, 0, 0),
			ref = var11
		}, var17())
	})
end