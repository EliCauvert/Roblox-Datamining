local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerModule = require(viewRecyclerReact.Parent.ViewRecycler)
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclableViewRegistryModule = require(script.Parent.RecyclableViewRegistry)
local signalsModule = require(viewRecyclerReact.Parent.Signals)
local signalsExperimentalModule = require(viewRecyclerReact.Parent.SignalsExperimental)

return function(p1, p2, p3, p4, p5)
	-- upvalues: recyclableViewRegistryModule (ref), signalsModule (ref), reactModule (ref), viewRecyclerModule (ref), signalsExperimentalModule (ref)
	local metadata = recyclableViewRegistryModule.getMetadata(p2)
	assert(metadata ~= nil, "RecyclableViewRecord: unknown Recyclable view type")
	p4 = p4 or metadata.readiness
	local var1 = if p5 == nil then metadata.hideWhilePending else p5
	local var2, var3 = signalsModule.createSignal(p3)
	local var4, var5 = signalsModule.createSignal(p3)
	local var6, var7 = reactModule.createBinding(false)
	local var8, var9 = signalsModule.createSignal(if p3 == nil then 0 else 1)
	local var10, var11 = signalsModule.createSignal({ selfSizing = false, axis = viewRecyclerModule.Axis.Y })
	local var12, var13 = signalsModule.createSignal(nil)
	local frame = Instance.new("Frame")
	frame.Name = `ListItemViewFrame{p1}`
	frame.BackgroundTransparency = 1
	frame.BorderSizePixel = 0
	frame.Position = UDim2.new()
	frame.Size = UDim2.new()
	local var14 = nil
	local var15 = nil
	local var16 = nil
	local var17 = nil
	local var18 = false
	local t = {}
	local var19 = p3
	local var20 = var10(false)
	local var21 = if p3 == nil then 0 else 1
	local var22 = true
	local var23 = false
	
	local function bindHost(p6)
		-- upvalues: var23 (write), var14 (write)
		assert(not var23, "RecyclableViewRecord: cannot bind a destroyed host")
		assert(var14 == nil, "RecyclableViewRecord: host is already bound")
		var14 = p6
		local var24 = true
		
		return function()
			-- upvalues: var24 (write), var14 (copy), p6 (ref)
			if var24 and var14 == p6 then
				var24 = false
				var14 = nil
			end
		end
	end
	
	local function valueSignal(value)
		-- upvalues: var4 (ref), var17 (write)
		local var24 = var4(value)
		assert(var24 ~= nil, "RecyclableViewRecord: value read before first Assignment")
		
		return if var17 == "composition" then var24.value.props else var24.value
	end
	
	local function itemSignal(value)
		-- upvalues: var4 (ref)
		local var24 = var4(value)
		assert(var24 ~= nil, "RecyclableViewRecord: item read before first Assignment")
		
		return var24.value
	end
	
	local function itemKeySignal(value)
		-- upvalues: var4 (ref)
		local var24 = var4(value)
		assert(var24 ~= nil, "RecyclableViewRecord: item key read before first Assignment")
		
		return var24.key
	end
	
	local function _(p6)
		-- upvalues: var19 (write), p4 (ref), var22 (write), var1 (ref), var23 (write), frame (ref)
		local var24 = "hidden"
		
		if var19 ~= nil then
			if p4 == "ReadyOnAssignment" or var22 then
				var24 = "presented"
			elseif not var1 then
				var24 = "pending"
			end
		end
		p6.assignment = var19
		p6.host = if var23 then nil else frame
		p6.phase = var24
		p6.visible = var19 ~= nil and var24 ~= "hidden"
		
		return p6
	end
	
	local function bindPlacement(p6, p7)
		-- upvalues: var23 (write), var15 (write), var16 (write), var18 (write), var19 (write)
		assert(not var23, "RecyclableViewRecord: cannot bind placement after destroy")
		assert(p6 == nil == (p7 == nil), "RecyclableViewRecord: placement kind and port must be bound together")
		
		if var15 == p7 then
			assert(var16 == p6, "RecyclableViewRecord: one placement port cannot change kind")
			
			return
		elseif var15 ~= nil then
			var15.apply(nil)
			var18 = var19 ~= nil
		end
		var15 = p7
		var16 = p6
	end
	
	local _ = function(p6)
		-- upvalues: var23 (write), var19 (write), var14 (write), var15 (write), var18 (write)
		assert(not var23, "RecyclableViewRecord: cannot publish after destroy")
		
		if p6 == nil and var19 ~= nil or var19 ~= nil and var19.key ~= p6.key then
			local var24 = var14
			
			if var24 ~= nil and var15 == nil and not var18 then
				var24.clearSelection()
			end
		end
		var18 = false
		
		return var19
	end
	
	local _ = function()
		-- upvalues: var15 (write), t (ref), var19 (write), p4 (ref), var22 (write), var1 (ref), var23 (write), frame (ref)
		if var15 == nil then return end
		local var24 = "hidden"
		
		if var19 ~= nil then
			if p4 == "ReadyOnAssignment" or var22 then
				var24 = "presented"
			elseif not var1 then
				var24 = "pending"
			end
		end
		t.assignment = var19
		t.host = if var23 then nil else frame
		t.phase = var24
		t.visible = var19 ~= nil and var24 ~= "hidden"
		var15.apply(t)
	end
	
	return {
		id = p1,
		viewType = p2,
		itemViewType = p2,
		signal = var2,
		itemSignal = itemSignal,
		itemKeySignal = itemKeySignal,
		set = if p4 == "ReadyOnAssignment" then function(value)
			-- upvalues: var23 (write), var19 (write), var14 (write), var15 (write), var18 (write), var3 (ref), var22 (write), var17 (write), var16 (write), var5 (ref), t (ref), p4 (ref), var1 (ref), frame (ref)
			assert(not var23, "RecyclableViewRecord: cannot publish after destroy")
			local var24 = var19
			
			if value == nil and var24 ~= nil or var24 ~= nil and var24.key ~= value.key then
				local var25 = var14
				
				if var25 ~= nil and var15 == nil and not var18 then
					var25.clearSelection()
				end
			end
			var18 = false
			
			if value == nil then
				var19 = nil
				var3(nil)
				
				return
			end
			var19 = value
			var22 = true
			var17 = var16
			var5(value)
			var3(value)
			
			if var15 == nil then return end
			local var26 = var19
			local var27 = "hidden"
			
			if var26 ~= nil then
				var27 = "presented"
			end
			t.assignment = var26
			t.host = if var23 then nil else frame
			t.phase = var27
			t.visible = var26 ~= nil and var27 ~= "hidden"
			var15.apply(t)
		end else function(value)
			-- upvalues: var23 (write), var19 (write), var14 (write), var15 (write), var18 (write), var22 (write), var21 (write), signalsExperimentalModule (copy), var17 (write), var16 (write), var5 (ref), var9 (ref), var3 (ref), var7 (ref), t (ref), p4 (ref), var1 (ref), frame (ref)
			assert(not var23, "RecyclableViewRecord: cannot publish after destroy")
			
			if value == nil and var19 ~= nil or var19 ~= nil and var19.key ~= value.key then
				local var24 = var14
				
				if var24 ~= nil and var15 == nil and not var18 then
					var24.clearSelection()
				end
			end
			var18 = false
			local var25 = value ~= nil and (if var19 ~= nil then if var19.generation == value.generation then not var22 else true else true)
			
			if var25 then
				var21 += 1
			end
			var19 = value
			
			if value == nil or var25 then
				var22 = false
			end
			signalsExperimentalModule.batch(function()
				-- upvalues: value (ref), var17 (copy), var16 (copy), var5 (copy), var25 (ref), var9 (copy), var21 (copy), var3 (copy), var7 (copy)
				if value ~= nil then
					var17 = var16
					var5(value)
				end
				if var25 then
					var9(var21)
				end
				var3(value)
				
				if value == nil or var25 then
					var7(value ~= nil)
				end
			end)
			
			if value ~= nil then
				local var26 = var15
				
				if var26 == nil then return end
				local var27 = var19
				local var28 = "hidden"
				
				if var27 ~= nil then
					if p4 == "ReadyOnAssignment" or var22 then
						var28 = "presented"
					elseif not var1 then
						var28 = "pending"
					end
				end
				t.assignment = var27
				t.host = if var23 then nil else frame
				t.phase = var28
				t.visible = var27 ~= nil and var28 ~= "hidden"
				var26.apply(t)
			end
		end,
		valueSignal = valueSignal,
		pending = var6,
		contentRevision = var8,
		commitContent = function(p6, p7)
			-- upvalues: var19 (write), var23 (write), p4 (ref), var21 (write), var22 (write), var7 (ref), var15 (write), t (ref), var1 (ref), frame (ref)
			if var23 or p4 ~= "ReadyOnCommit" or (var19 == nil or var19.generation ~= p6) or p7 ~= var21 then
				return false
			end
			var22 = true
			var7(false)
			
			if var15 ~= nil then
				local var24 = "hidden"
				
				if var19 ~= nil then
					var24 = "presented"
				end
				t.assignment = var19
				t.host = if var23 then nil else frame
				t.phase = var24
				t.visible = var19 ~= nil and var24 ~= "hidden"
				var15.apply(t)
			end
			return true
		end,
		bindPlacement = bindPlacement,
		readiness = p4,
		hideWhilePending = var1,
		structuralPlacement = var10,
		compositionPlacementManager = var12,
		setStructuralPlacement = function(value, p6)
			-- upvalues: var20 (write), var11 (ref)
			if var20.axis == value and var20.selfSizing == p6 then
				return
			end
			var20 = { axis = value, selfSizing = p6 }
			var11(var20)
		end,
		setCompositionPlacementManager = var13,
		portalFrame = function(_)
			-- upvalues: var23 (write), frame (ref)
			return if var23 then nil else frame
		end,
		bindHost = bindHost,
		clearSelection = function()
			-- upvalues: var14 (write)
			if var14 ~= nil then
				var14.clearSelection()
			end
		end,
		detachFromPlaceholder = function(p6)
			-- upvalues: var14 (write)
			if var14 ~= nil then
				var14.detachFromPlaceholder(p6)
			end
		end,
		destroy = function()
			-- upvalues: var23 (write), var15 (write), var16 (write), var14 (write), var7 (ref), frame (ref)
			if var23 then return end
			if var15 ~= nil then
				var15.apply(nil)
				var15 = nil
				var16 = nil
			end
			var23 = true
			var14 = nil
			var7(false)
			frame.Parent = nil
			frame:Destroy()
		end
	}
end