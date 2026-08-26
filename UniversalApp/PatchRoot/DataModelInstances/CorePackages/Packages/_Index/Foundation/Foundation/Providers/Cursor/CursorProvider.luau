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

return function(p1)
	-- upvalues: reactModule (ref), useRefCache (ref), useTokensModule (ref), keyUtilitiesModule (ref), dashModule (ref), cursorModule (ref), cursorComponentModule (ref), isPluginSecurityModule (ref), coreGui (ref), guiService (ref), cursorContextModule (ref)
	local var1, var2 = reactModule.useState({})
	local var3 = reactModule.useRef(nil)
	local var4, var5 = reactModule.useState(nil)
	local var6 = useRefCache()
	local var7 = useTokensModule()
	local var8 = reactModule.useMemo(function()
		-- upvalues: var6 (ref), var2 (ref), keyUtilitiesModule (copy), var7 (ref), dashModule (copy)
		return {
			refCache = var6,
			setMountedCursors = var2,
			getCursor = function(p2)
				-- upvalues: keyUtilitiesModule (copy), var7 (copy), var2 (copy), dashModule (copy), var6 (copy)
				local var9 = keyUtilitiesModule.mapCursorToKey(p2, var7)
				var2(function(p3)
					-- upvalues: var9 (ref), dashModule (copy)
					return if p3[var9] == nil then dashModule.union(p3, { [var9] = true }) else p3
				end)
				
				return var6[var9]
			end
		}
	end, { var6, var2, var7 })
	
	local var9 = function()
		-- upvalues: var1 (ref), var6 (ref), var4 (ref), keyUtilitiesModule (copy), reactModule (copy), cursorModule (copy), cursorComponentModule (copy)
		local t = {}
		
		for i, v in var1 do
			local var10 = var6[i] ~= nil and (var4 ~= nil and var6[i].current == var4)
			local parts = string.split(i, " ")
			
			if #parts == 2 then
				local var11, var12 = keyUtilitiesModule.decodeCursorTypeKey(parts)
				t[i] = reactModule.createElement(cursorModule, {
					ref = var6[i],
					isVisible = var10,
					cursorType = var11,
					colorNamespace = var12
				})
			else
				local var13, var14, var15, var16 = keyUtilitiesModule.decodeKey(parts)
				t[i] = reactModule.createElement(cursorComponentModule, {
					ref = var6[i],
					isVisible = var10,
					cornerRadius = var13,
					offset = var14,
					borderWidth = var15,
					colorNamespace = var16
				})
			end
		end
		return t
	end
	
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), isPluginSecurityModule (copy), coreGui (copy), guiService (copy), var5 (ref)
		if var3.current == nil or not game:IsAncestorOf(var3.current) then
			return
		end
		local var17 = isPluginSecurityModule() and var3.current:IsDescendantOf(coreGui)
		
		local function setUpSelectionImageObjectConnection()
			-- upvalues: var17 (ref), guiService (copy), var5 (copy)
			return if var17 then guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: guiService (copy), var5 (copy)
				if guiService.SelectedCoreObject == nil then
					var5(nil)
					
					return
				end
				var5(guiService.SelectedCoreObject.SelectionImageObject)
			end) else guiService:GetPropertyChangedSignal("SelectedObject"):Connect(function()
				-- upvalues: guiService (copy), var5 (copy)
				if guiService.SelectedObject == nil then
					var5(nil)
					
					return
				end
				var5(guiService.SelectedObject.SelectionImageObject)
			end)
		end
		
		local var18 = setUpSelectionImageObjectConnection()
		local ancestryChangedConnection = var3.current.AncestryChanged:Connect(function()
			-- upvalues: var18 (write), setUpSelectionImageObjectConnection (ref)
			var18:Disconnect()
			var18 = setUpSelectionImageObjectConnection()
		end)
		
		return function()
			-- upvalues: var18 (write), ancestryChangedConnection (ref)
			var18:Disconnect()
			ancestryChangedConnection:Disconnect()
		end
	end, {})
	
	return reactModule.createElement(cursorContextModule.Provider, { value = var8 }, {
		Children = reactModule.createElement(reactModule.Fragment, {}, p1.children),
		FoundationCursorContainer = reactModule.createElement("Frame", {
			Visible = false,
			Size = UDim2.new(0, 0, 0, 0),
			ref = var3
		}, var9())
	})
end