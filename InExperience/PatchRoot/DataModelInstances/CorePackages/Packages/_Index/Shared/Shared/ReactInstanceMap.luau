local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local luauPolyfillModule = require(parent.LuauPolyfill)
local error = luauPolyfillModule.Error
local inspect = luauPolyfillModule.util.inspect
local getComponentNameModule = require(script.Parent.getComponentName)
local _ = script:FindFirstAncestor("ReactUtils")
local dEV = reactGlobalsModule.__DEV__
local var3 = require(parent.SafeFlags).createGetFFlag("ReactInstanceMapDisableErrorChecking")()
local t = {
	remove = function(p0) --[[ line: 51 ]]
		p0._reactInternals = nil
	end
}

local function _(p1) --[[ line: 44 | named "isValidFiber" ]]
	return p1.tag ~= nil and (p1.subtreeFlags ~= nil and (p1.lanes ~= nil and p1.childLanes ~= nil))
end

if var3 and not dEV then
	function t.get(p2) --[[ line: 82 ]]
		return p2._reactInternals
	end
else
	function t.get(p3) --[[ line: 56 ]]
		-- upvalues: error (ref), getComponentNameModule (ref), inspect (ref)
		local reactInternals = p3._reactInternals
		
		if not (reactInternals.tag ~= nil and (reactInternals.subtreeFlags ~= nil and (reactInternals.lanes ~= nil and reactInternals.childLanes ~= nil))) then
			error(error.new("invalid fiber in " .. (getComponentNameModule(p3) or "UNNAMED Component") .. " during get from ReactInstanceMap! " .. inspect(reactInternals)))
			
			return reactInternals
		elseif reactInternals.alternate ~= nil then
			local alternate = reactInternals.alternate
			
			if not (alternate.tag ~= nil and (alternate.subtreeFlags ~= nil and (alternate.lanes ~= nil and alternate.childLanes ~= nil))) then
				error(error.new("invalid alternate fiber (" .. (getComponentNameModule(p3) or "UNNAMED alternate") .. ") in " .. (getComponentNameModule(p3) or "UNNAMED Component") .. " during get from ReactInstanceMap! " .. inspect(reactInternals.alternate)))
			end
		end
		return reactInternals
	end
end
function t.has(p4) --[[ line: 87 ]]
	return p4._reactInternals ~= nil
end

if var3 and not dEV then
	function t.set(p5, p6) --[[ line: 129 ]]
		p5._reactInternals = p6
	end
	
	return t
end
function t.set(p7, p8) --[[ line: 92 ]]
	-- upvalues: getComponentNameModule (ref), inspect (ref), error (ref)
	local var5 = p8
	local _ = nil
	while var5 ~= nil do
		local var6 = var5
		local var7 = var6.tag ~= nil and (var6.subtreeFlags ~= nil and (var6.lanes ~= nil and var6.childLanes ~= nil))
		
		if not var7 then
			local text = "invalid fiber in " .. (getComponentNameModule(p7) or "UNNAMED Component") .. " being set in ReactInstanceMap! " .. inspect(var5) .. "\n"
			
			if p8 ~= var5 then
				text ..= " (from original fiber " .. getComponentNameModule(p7) or "UNNAMED Component" .. ")"
			end
			error(error.new(text))
		elseif var5.alternate ~= nil then
			local alternate = var5.alternate
			var7 = alternate.tag ~= nil and (alternate.subtreeFlags ~= nil and (alternate.lanes ~= nil and alternate.childLanes ~= nil))
			
			if not var7 then
				local text = "invalid alternate fiber (" .. (getComponentNameModule(p7) or "UNNAMED alternate") .. ") in " .. (getComponentNameModule(p7) or "UNNAMED Component") .. " being set in ReactInstanceMap! " .. inspect(var5.alternate) .. "\n"
				
				if p8 ~= var5 then
					text ..= " (from original fiber " .. getComponentNameModule(p7) or "UNNAMED Component" .. ")"
				end
				error(error.new(text))
			end
		end
		var5 = var5.return_
	end
	p7._reactInternals = p8
end

return t