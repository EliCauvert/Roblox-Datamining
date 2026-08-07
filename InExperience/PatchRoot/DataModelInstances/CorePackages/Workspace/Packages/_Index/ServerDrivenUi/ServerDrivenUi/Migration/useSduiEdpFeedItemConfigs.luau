local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiComponent = sduiCoreSystemModule.SduiComponent
local sduiErrors = sduiCoreSystemModule.SduiErrors
local _ = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getSduiFeedStoreModule = require(serverDrivenUi.DataStore.getSduiFeedStore)
local _ = require(serverDrivenUi.DataStore.SduiFeedStoreTypes)
local fFlagSduiGetItemCollectionKeys = require(serverDrivenUi.Flags).FFlagSduiGetItemCollectionKeys

local function _(p0, p1, p2, p3, p4) --[[ line: 30 | named "getLayoutOrder" ]]
	if p0 and p2[p0] then
		p4({
			layoutOrder = p0,
			itemKey = p3,
			existingComponent = p2[p0]
		})
		
		return p1
	end
	return p0 or p1
end

return function(p5) --[[ line: 67 | named "useSduiEdpFeedItemConfigs" ]]
	-- upvalues: reactModule (ref), getSduiFeedStoreModule (ref), fFlagSduiGetItemCollectionKeys (ref), signalsReactModule (ref), sduiErrors (ref), sduiComponent (ref)
	local var5 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 68 ]]
		-- upvalues: p5 (ref), getSduiFeedStoreModule (copy), fFlagSduiGetItemCollectionKeys (copy)
		return function(p6) --[[ line: 69 ]]
			-- upvalues: p5 (copy), getSduiFeedStoreModule (copy), fFlagSduiGetItemCollectionKeys (copy)
			if not p5.shouldInterleaveSdui then
				return {}
			end
			local var9 = getSduiFeedStoreModule(p5.storeKey)
			local t = {}
			
			for i, v in if fFlagSduiGetItemCollectionKeys and var9.getItemCollectionKeys then var9.getItemCollectionKeys(p6) else {} do
				local itemCollection = var9.getItemCollection(v)
				
				if itemCollection then
					t[v] = itemCollection(p6)
				end
			end
			return t
		end
	end, { p5.storeKey, p5.shouldInterleaveSdui }))
	local var6 = reactModule.useMemo(function() --[[ line: 92 ]]
		-- upvalues: p5 (ref)
		local t = {}
		
		if not p5.shouldInterleaveSdui then
			return t
		end
		for i, v in p5.portraitLayoutConfig do
			t[v] = i
		end
		return t
	end, { p5.portraitLayoutConfig, p5.shouldInterleaveSdui })
	local var7 = reactModule.useMemo(function() --[[ line: 103 ]]
		-- upvalues: p5 (ref)
		local t = {}
		
		if not p5.shouldInterleaveSdui then
			return t
		end
		for i, v in p5.landscapeLayoutConfig do
			t[v] = i
		end
		return t
	end, { p5.landscapeLayoutConfig, p5.shouldInterleaveSdui })
	local var8 = reactModule.useCallback(function(p7, p8, p9) --[[ line: 115 ]]
		-- upvalues: p5 (ref), var6 (ref), var7 (ref)
		if not p5.shouldInterleaveSdui then
			return {}
		end
		local var16
		local layoutOrder = p7.sduiConfig and (p7.sduiConfig.props and p7.sduiConfig.props.LayoutOrder)
		local var15 = p5.defaultLayoutOrder + p9
		local logLayoutConflictFn = p5.logLayoutConflictFn
		
		if layoutOrder and var6[layoutOrder] then
			logLayoutConflictFn({
				layoutOrder = layoutOrder,
				itemKey = p8,
				existingComponent = var6[layoutOrder]
			})
			var16 = var15
		else
			var16 = layoutOrder or var15
		end
		local var17
		local logLayoutConflictFn_1 = p5.logLayoutConflictFn
		
		if layoutOrder and var7[layoutOrder] then
			logLayoutConflictFn_1({
				layoutOrder = layoutOrder,
				itemKey = p8,
				existingComponent = var7[layoutOrder]
			})
			var17 = var15
		else
			var17 = layoutOrder or var15
		end
		return { portrait = var16, landscape = var17 }
	end, {
		var7,
		var6,
		p5.defaultLayoutOrder,
		p5.logLayoutConflictFn,
		p5.shouldInterleaveSdui
	})
	
	return reactModule.useMemo(function() --[[ line: 156 ]]
		-- upvalues: p5 (ref), var5 (ref), var8 (ref), sduiErrors (copy), reactModule (copy), sduiComponent (copy)
		if not p5.shouldInterleaveSdui then
			return {}
		end
		local t = {}
		local var19 = 0
		
		for i, v in var5 do
			local var20 = var8(v, i, var19)
			var19 += 1
			local var21 = if v then v.sduiConfig else nil
			local storeKey = `SduiEdpFeedItem-{p5.storeKey}-{i}`
			
			if var21 == nil then
				p5.sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentConfig, {
					name = storeKey,
					message = `Unable to render edp feed item for sdui. Feed store key: {p5.storeKey}, Collection key: {i}`
				}, p5.sduiContext.appPage)
			else
				t[i] = {
					portraitLayoutOrder = var20.portrait,
					landscapeLayoutOrder = var20.landscape,
					renderComponent = function() --[[ line: 179 ]]
						-- upvalues: reactModule (copy), sduiComponent (copy), storeKey (ref), var21 (ref), p5 (copy)
						return reactModule.createElement(sduiComponent, {
							debugName = storeKey,
							componentConfig = var21,
							sduiContext = p5.sduiContext
						})
					end
				}
			end
		end
		return t
	end, {
		var5,
		p5.storeKey,
		p5.sduiContext,
		var8,
		p5.shouldInterleaveSdui
	})
end