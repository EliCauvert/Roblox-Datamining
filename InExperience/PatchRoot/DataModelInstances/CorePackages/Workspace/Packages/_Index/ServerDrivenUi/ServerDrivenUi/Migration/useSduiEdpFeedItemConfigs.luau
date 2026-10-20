local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiComponent = SduiCoreSystemModule.SduiComponent
local SduiErrors = SduiCoreSystemModule.SduiErrors
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetSduiFeedStoreModule = require(ServerDrivenUi.DataStore.getSduiFeedStore)
local _ = require(ServerDrivenUi.DataStore.SduiFeedStoreTypes)

local function _(LayoutOrder, p1, p2, ItemKey, Callback: (any) -> ())
	if LayoutOrder and p2[LayoutOrder] then
		Callback({
			layoutOrder = LayoutOrder,
			itemKey = ItemKey,
			existingComponent = p2[LayoutOrder]
		})
		
		return p1
	else
		return if LayoutOrder then LayoutOrder else p1
	end
end

return function(p1)
	-- upvalues: ReactModule (copy), GetSduiFeedStoreModule (copy), SignalsReactModule (copy), SduiErrors (copy), SduiComponent (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: p1 (copy), GetSduiFeedStoreModule (upval)
		return function(p2)
			-- upvalues: p1 (upval), GetSduiFeedStoreModule (upval)
			if not p1.shouldInterleaveSdui then
				return {}
			end
			local SduiFeedStoreModule = GetSduiFeedStoreModule(p1.storeKey)
			local t = {}
			
			for _, value in if SduiFeedStoreModule.getItemCollectionKeys then SduiFeedStoreModule.getItemCollectionKeys(p2) else {} do
				local ItemCollection = SduiFeedStoreModule.getItemCollection(value)
				
				if ItemCollection then
					t[value] = ItemCollection(p2)
				end
			end
			return t
		end
	end, { p1.storeKey, p1.shouldInterleaveSdui })))
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		local t = {}
		
		if not p1.shouldInterleaveSdui then
			return t
		end
		for i, value in p1.portraitLayoutConfig do
			t[value] = i
		end
		return t
	end, { p1.portraitLayoutConfig, p1.shouldInterleaveSdui })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		local t = {}
		
		if not p1.shouldInterleaveSdui then
			return t
		end
		for i, value in p1.landscapeLayoutConfig do
			t[value] = i
		end
		return t
	end, { p1.landscapeLayoutConfig, p1.shouldInterleaveSdui })
	local UseResult = ReactModule.useCallback(function(p3, ItemKey, p4)
		-- upvalues: p1 (copy), UseMemoResult (copy), UseMemoResult1 (copy)
		if not p1.shouldInterleaveSdui then
			return {}
		end
		local LayoutOrder = p3.sduiConfig and (p3.sduiConfig.props and p3.sduiConfig.props.LayoutOrder)
		local NewDefaultLayoutOrder = p1.defaultLayoutOrder + p4
		local LogLayoutConflictFnFunction: (any) -> () = p1.logLayoutConflictFn
		local LayoutOrder1 = nil
		
		if LayoutOrder and UseMemoResult[LayoutOrder] then
			LogLayoutConflictFnFunction({
				layoutOrder = LayoutOrder,
				itemKey = ItemKey,
				existingComponent = UseMemoResult[LayoutOrder]
			})
			LayoutOrder1 = NewDefaultLayoutOrder
		else
			LayoutOrder1 = if LayoutOrder then LayoutOrder else NewDefaultLayoutOrder
		end
		local LogLayoutConflictFnFunction1: (any) -> () = p1.logLayoutConflictFn
		local LayoutOrder2 = nil
		
		if LayoutOrder and UseMemoResult1[LayoutOrder] then
			LogLayoutConflictFnFunction1({
				layoutOrder = LayoutOrder,
				itemKey = ItemKey,
				existingComponent = UseMemoResult1[LayoutOrder]
			})
			LayoutOrder2 = NewDefaultLayoutOrder
		else
			LayoutOrder2 = if LayoutOrder then LayoutOrder else NewDefaultLayoutOrder
		end
		return { portrait = LayoutOrder1, landscape = LayoutOrder2 }
	end, {
		UseMemoResult1,
		UseMemoResult,
		p1.defaultLayoutOrder,
		p1.logLayoutConflictFn,
		p1.shouldInterleaveSdui
	})
	
	return ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseSignalStateResult (copy), UseResult (copy), SduiErrors (upval), ReactModule (upval), SduiComponent (upval)
		if not p1.shouldInterleaveSdui then
			return {}
		end
		local t = {}
		local Count = 0
		
		for i, value in UseSignalStateResult do
			local UseResultResult = UseResult(value, i, Count)
			Count += 1
			local SduiConfig = value and value.sduiConfig or nil
			local SduiEdpFeedItemName: string = `SduiEdpFeedItem-{p1.storeKey}-{i}`
			
			if SduiConfig == nil then
				p1.sduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.NilComponentConfig, {
					name = SduiEdpFeedItemName,
					message = `Unable to render edp feed item for sdui. Feed store key: {p1.storeKey}, Collection key: {i}`
				}, p1.sduiContext.appPage)
			else
				t[i] = {
					portraitLayoutOrder = UseResultResult.portrait,
					landscapeLayoutOrder = UseResultResult.landscape,
					renderComponent = function()
						-- upvalues: ReactModule (upval), SduiComponent (upval), SduiEdpFeedItemName (copy), SduiConfig (copy), p1 (upval)
						return ReactModule.createElement(SduiComponent, {
							debugName = SduiEdpFeedItemName,
							componentConfig = SduiConfig,
							sduiContext = p1.sduiContext
						})
					end
				}
			end
		end
		return t
	end, {
		UseSignalStateResult,
		p1.storeKey,
		p1.sduiContext,
		UseResult,
		p1.shouldInterleaveSdui
	})
end