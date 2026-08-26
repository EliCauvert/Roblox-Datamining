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

local function _(p1, p2, p3, p4, p5)
	if p1 and p3[p1] then
		p5({
			layoutOrder = p1,
			itemKey = p4,
			existingComponent = p3[p1]
		})
		
		return p2
	end
	return p1 or p2
end

return function(p1)
	-- upvalues: reactModule (ref), getSduiFeedStoreModule (ref), fFlagSduiGetItemCollectionKeys (ref), signalsReactModule (ref), sduiErrors (ref), sduiComponent (ref)
	local var1 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: p1 (ref), getSduiFeedStoreModule (copy), fFlagSduiGetItemCollectionKeys (copy)
		return function(p2)
			-- upvalues: p1 (copy), getSduiFeedStoreModule (copy), fFlagSduiGetItemCollectionKeys (copy)
			if not p1.shouldInterleaveSdui then
				return {}
			end
			local var2 = getSduiFeedStoreModule(p1.storeKey)
			local t = {}
			
			for i, v in if fFlagSduiGetItemCollectionKeys and var2.getItemCollectionKeys then var2.getItemCollectionKeys(p2) else {} do
				local itemCollection = var2.getItemCollection(v)
				
				if itemCollection then
					t[v] = itemCollection(p2)
				end
			end
			return t
		end
	end, { p1.storeKey, p1.shouldInterleaveSdui }))
	local var3 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		local t = {}
		
		if not p1.shouldInterleaveSdui then
			return t
		end
		for i, v in p1.portraitLayoutConfig do
			t[v] = i
		end
		return t
	end, { p1.portraitLayoutConfig, p1.shouldInterleaveSdui })
	local var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		local t = {}
		
		if not p1.shouldInterleaveSdui then
			return t
		end
		for i, v in p1.landscapeLayoutConfig do
			t[v] = i
		end
		return t
	end, { p1.landscapeLayoutConfig, p1.shouldInterleaveSdui })
	local var5 = reactModule.useCallback(function(p3, p4, p5)
		-- upvalues: p1 (ref), var3 (ref), var4 (ref)
		if not p1.shouldInterleaveSdui then
			return {}
		end
		local var6
		local layoutOrder = p3.sduiConfig and (p3.sduiConfig.props and p3.sduiConfig.props.LayoutOrder)
		local var7 = p1.defaultLayoutOrder + p5
		local logLayoutConflictFn = p1.logLayoutConflictFn
		
		if layoutOrder and var3[layoutOrder] then
			logLayoutConflictFn({
				layoutOrder = layoutOrder,
				itemKey = p4,
				existingComponent = var3[layoutOrder]
			})
			var6 = var7
		else
			var6 = layoutOrder or var7
		end
		local var8
		local logLayoutConflictFn_1 = p1.logLayoutConflictFn
		
		if layoutOrder and var4[layoutOrder] then
			logLayoutConflictFn_1({
				layoutOrder = layoutOrder,
				itemKey = p4,
				existingComponent = var4[layoutOrder]
			})
			var8 = var7
		else
			var8 = layoutOrder or var7
		end
		return { portrait = var6, landscape = var8 }
	end, {
		var4,
		var3,
		p1.defaultLayoutOrder,
		p1.logLayoutConflictFn,
		p1.shouldInterleaveSdui
	})
	
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref), var1 (ref), var5 (ref), sduiErrors (copy), reactModule (copy), sduiComponent (copy)
		if not p1.shouldInterleaveSdui then
			return {}
		end
		local t = {}
		local var6 = 0
		
		for i, v in var1 do
			local var7 = var5(v, i, var6)
			var6 += 1
			local var8 = if v then v.sduiConfig else nil
			local storeKey = `SduiEdpFeedItem-{p1.storeKey}-{i}`
			
			if var8 == nil then
				p1.sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentConfig, {
					name = storeKey,
					message = `Unable to render edp feed item for sdui. Feed store key: {p1.storeKey}, Collection key: {i}`
				}, p1.sduiContext.appPage)
			else
				t[i] = {
					portraitLayoutOrder = var7.portrait,
					landscapeLayoutOrder = var7.landscape,
					renderComponent = function()
						-- upvalues: reactModule (copy), sduiComponent (copy), storeKey (ref), var8 (ref), p1 (copy)
						return reactModule.createElement(sduiComponent, {
							debugName = storeKey,
							componentConfig = var8,
							sduiContext = p1.sduiContext
						})
					end
				}
			end
		end
		return t
	end, {
		var1,
		p1.storeKey,
		p1.sduiContext,
		var5,
		p1.shouldInterleaveSdui
	})
end