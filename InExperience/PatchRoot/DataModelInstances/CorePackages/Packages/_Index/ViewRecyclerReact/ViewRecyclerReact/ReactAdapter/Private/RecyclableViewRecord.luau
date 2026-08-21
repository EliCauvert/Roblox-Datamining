local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerModule = require(viewRecyclerReact.Parent.ViewRecycler)
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclableViewRegistryModule = require(script.Parent.RecyclableViewRegistry)
local signalsModule = require(viewRecyclerReact.Parent.Signals)
local signalsExperimentalModule = require(viewRecyclerReact.Parent.SignalsExperimental)

return function(p0, p1, p2, p3, p4) --[[ line: 59 | named "createRecyclableViewRecord" ]]
	-- upvalues: recyclableViewRegistryModule (ref), signalsModule (ref), reactModule (ref), viewRecyclerModule (ref), signalsExperimentalModule (ref)
	local metadata = recyclableViewRegistryModule.getMetadata(p1)
	assert(metadata ~= nil, "RecyclableViewRecord: unknown Recyclable view type")
	p3 = p3 or metadata.readiness
	local var8 = if p4 == nil then metadata.hideWhilePending else p4
	local var9, var10 = signalsModule.createSignal(p2)
	local var11, var12 = signalsModule.createSignal(p2)
	local var13, var14 = reactModule.createBinding(false)
	local var15, var16 = signalsModule.createSignal(if p2 == nil then 0 else 1)
	local var17, var18 = signalsModule.createSignal({ selfSizing = false, axis = viewRecyclerModule.Axis.Y })
	local var19, var20 = signalsModule.createSignal(nil)
	local frame = Instance.new("Frame")
	frame.Name = `ListItemViewFrame{p0}`
	frame.BackgroundTransparency = 1
	frame.BorderSizePixel = 0
	frame.Position = UDim2.new()
	frame.Size = UDim2.new()
	local var22 = nil
	local var23 = nil
	local var24 = nil
	local var25 = nil
	local var26 = false
	local t = {}
	local var28 = p2
	local var29 = var17(false)
	local var30 = if p2 == nil then 0 else 1
	local var31 = true
	local var32 = false
	
	local function bindHost(p5) --[[ line: 99 ]]
		-- upvalues: var32 (write), var22 (write)
		assert(not var32, "RecyclableViewRecord: cannot bind a destroyed host")
		assert(var22 == nil, "RecyclableViewRecord: host is already bound")
		var22 = p5
		local var38 = true
		
		return function() --[[ line: 104 ]]
			-- upvalues: var38 (write), var22 (copy), p5 (ref)
			if var38 and var22 == p5 then
				var38 = false
				var22 = nil
			end
		end
	end
	
	local function valueSignal(value) --[[ line: 112 ]]
		-- upvalues: var11 (ref), var25 (write)
		local var39 = var11(value)
		assert(var39 ~= nil, "RecyclableViewRecord: value read before first Assignment")
		
		return if var25 == "composition" then var39.value.props else var39.value
	end
	
	local function itemSignal(value) --[[ line: 120 ]]
		-- upvalues: var11 (ref)
		local var40 = var11(value)
		assert(var40 ~= nil, "RecyclableViewRecord: item read before first Assignment")
		
		return var40.value
	end
	
	local function itemKeySignal(value) --[[ line: 126 ]]
		-- upvalues: var11 (ref)
		local var41 = var11(value)
		assert(var41 ~= nil, "RecyclableViewRecord: item key read before first Assignment")
		
		return var41.key
	end
	
	local function _(p6) --[[ line: 132 | named "writeHostState" ]]
		-- upvalues: var28 (write), p3 (ref), var31 (write), var8 (ref), var32 (write), frame (ref)
		local var42 = "hidden"
		
		if var28 ~= nil then
			if p3 == "ReadyOnAssignment" or var31 then
				var42 = "presented"
			elseif not var8 then
				var42 = "pending"
			end
		end
		p6.assignment = var28
		p6.host = if var32 then nil else frame
		p6.phase = var42
		p6.visible = var28 ~= nil and var42 ~= "hidden"
		
		return p6
	end
	
	local function bindPlacement(p7, p8) --[[ line: 149 ]]
		-- upvalues: var32 (write), var23 (write), var24 (write), var26 (write), var28 (write)
		assert(not var32, "RecyclableViewRecord: cannot bind placement after destroy")
		assert(p7 == nil == (p8 == nil), "RecyclableViewRecord: placement kind and port must be bound together")
		
		if var23 == p8 then
			assert(var24 == p7, "RecyclableViewRecord: one placement port cannot change kind")
			
			return
		elseif var23 ~= nil then
			var23.apply(nil)
			var26 = var28 ~= nil
		end
		var23 = p8
		var24 = p7
	end
	
	local _ = function(p9) --[[ line: 164 | named "preparePlacement" ]]
		-- upvalues: var32 (write), var28 (write), var22 (write), var23 (write), var26 (write)
		assert(not var32, "RecyclableViewRecord: cannot publish after destroy")
		
		if p9 == nil and var28 ~= nil or var28 ~= nil and var28.key ~= p9.key then
			local var43 = var22
			
			if var43 ~= nil and var23 == nil and not var26 then
				var43.clearSelection()
			end
		end
		var26 = false
		
		return var28
	end
	
	local _ = function() --[[ line: 177 | named "publishHostState" ]]
		-- upvalues: var23 (write), t (ref), var28 (write), p3 (ref), var31 (write), var8 (ref), var32 (write), frame (ref)
		if var23 == nil then return end
		local var44 = "hidden"
		
		if var28 ~= nil then
			if p3 == "ReadyOnAssignment" or var31 then
				var44 = "presented"
			elseif not var8 then
				var44 = "pending"
			end
		end
		t.assignment = var28
		t.host = if var32 then nil else frame
		t.phase = var44
		t.visible = var28 ~= nil and var44 ~= "hidden"
		var23.apply(t)
	end
	
	return {
		id = p0,
		viewType = p1,
		itemViewType = p1,
		signal = var9,
		itemSignal = itemSignal,
		itemKeySignal = itemKeySignal,
		set = if p3 == "ReadyOnAssignment" then function(value) --[[ line: 186 | named "setImmediate" ]]
			-- upvalues: var32 (write), var28 (write), var22 (write), var23 (write), var26 (write), var10 (ref), var31 (write), var25 (write), var24 (write), var12 (ref), t (ref), p3 (ref), var8 (ref), frame (ref)
			assert(not var32, "RecyclableViewRecord: cannot publish after destroy")
			local var50 = var28
			
			if value == nil and var50 ~= nil or var50 ~= nil and var50.key ~= value.key then
				local var51 = var22
				
				if var51 ~= nil and var23 == nil and not var26 then
					var51.clearSelection()
				end
			end
			var26 = false
			
			if value == nil then
				var28 = nil
				var10(nil)
				
				return
			end
			var28 = value
			var31 = true
			var25 = var24
			var12(value)
			var10(value)
			
			if var23 == nil then return end
			local var52 = var28
			local var53 = "hidden"
			
			if var52 ~= nil then
				var53 = "presented"
			end
			t.assignment = var52
			t.host = if var32 then nil else frame
			t.phase = var53
			t.visible = var52 ~= nil and var53 ~= "hidden"
			var23.apply(t)
		end else function(value) --[[ line: 201 | named "setCommitGated" ]]
			-- upvalues: var32 (write), var28 (write), var22 (write), var23 (write), var26 (write), var31 (write), var30 (write), signalsExperimentalModule (copy), var25 (write), var24 (write), var12 (ref), var16 (ref), var10 (ref), var14 (ref), t (ref), p3 (ref), var8 (ref), frame (ref)
			assert(not var32, "RecyclableViewRecord: cannot publish after destroy")
			
			if value == nil and var28 ~= nil or var28 ~= nil and var28.key ~= value.key then
				local var45 = var22
				
				if var45 ~= nil and var23 == nil and not var26 then
					var45.clearSelection()
				end
			end
			var26 = false
			local var46 = value ~= nil and (if var28 ~= nil then if var28.generation == value.generation then not var31 else true else true)
			
			if var46 then
				var30 += 1
			end
			var28 = value
			
			if value == nil or var46 then
				var31 = false
			end
			signalsExperimentalModule.batch(function() --[[ line: 212 ]]
				-- upvalues: value (ref), var25 (copy), var24 (copy), var12 (copy), var46 (ref), var16 (copy), var30 (copy), var10 (copy), var14 (copy)
				if value ~= nil then
					var25 = var24
					var12(value)
				end
				if var46 then
					var16(var30)
				end
				var10(value)
				
				if value == nil or var46 then
					var14(value ~= nil)
				end
			end)
			
			if value ~= nil then
				local var47 = var23
				
				if var47 == nil then return end
				local var48 = var28
				local var49 = "hidden"
				
				if var48 ~= nil then
					if p3 == "ReadyOnAssignment" or var31 then
						var49 = "presented"
					elseif not var8 then
						var49 = "pending"
					end
				end
				t.assignment = var48
				t.host = if var32 then nil else frame
				t.phase = var49
				t.visible = var48 ~= nil and var49 ~= "hidden"
				var47.apply(t)
			end
		end,
		valueSignal = valueSignal,
		pending = var13,
		contentRevision = var15,
		commitContent = function(p10, p11) --[[ line: 231 ]]
			-- upvalues: var28 (write), var32 (write), p3 (ref), var30 (write), var31 (write), var14 (ref), var23 (write), t (ref), var8 (ref), frame (ref)
			if var32 or p3 ~= "ReadyOnCommit" or (var28 == nil or var28.generation ~= p10) or p11 ~= var30 then
				return false
			end
			var31 = true
			var14(false)
			
			if var23 ~= nil then
				local var54 = "hidden"
				
				if var28 ~= nil then
					var54 = "presented"
				end
				t.assignment = var28
				t.host = if var32 then nil else frame
				t.phase = var54
				t.visible = var28 ~= nil and var54 ~= "hidden"
				var23.apply(t)
			end
			return true
		end,
		bindPlacement = bindPlacement,
		readiness = p3,
		hideWhilePending = var8,
		structuralPlacement = var17,
		compositionPlacementManager = var19,
		setStructuralPlacement = function(value, p12) --[[ line: 265 ]]
			-- upvalues: var29 (write), var18 (ref)
			if var29.axis == value and var29.selfSizing == p12 then
				return
			end
			var29 = { axis = value, selfSizing = p12 }
			var18(var29)
		end,
		setCompositionPlacementManager = var20,
		portalFrame = function(_) --[[ line: 276 ]]
			-- upvalues: var32 (write), frame (ref)
			return if var32 then nil else frame
		end,
		bindHost = bindHost,
		clearSelection = function() --[[ line: 280 ]]
			-- upvalues: var22 (write)
			if var22 ~= nil then
				var22.clearSelection()
			end
		end,
		detachFromPlaceholder = function(p13) --[[ line: 286 ]]
			-- upvalues: var22 (write)
			if var22 ~= nil then
				var22.detachFromPlaceholder(p13)
			end
		end,
		destroy = function() --[[ line: 292 ]]
			-- upvalues: var32 (write), var23 (write), var24 (write), var22 (write), var14 (ref), frame (ref)
			if var32 then return end
			if var23 ~= nil then
				var23.apply(nil)
				var23 = nil
				var24 = nil
			end
			var32 = true
			var22 = nil
			var14(false)
			frame.Parent = nil
			frame:Destroy()
		end
	}
end