local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local luauPolyfillModule = require(parent.LuauPolyfill)
local error = luauPolyfillModule.Error
local inspect = luauPolyfillModule.util.inspect
local getComponentNameModule = require(script.Parent.getComponentName)
local _ = script:FindFirstAncestor("ReactUtils")
local dEV = reactGlobalsModule.__DEV__
local var1 = require(parent.SafeFlags).createGetFFlag("ReactInstanceMapDisableErrorChecking")()
local t = {
	remove = function(p1)
		p1._reactInternals = nil
	end
}

local function _(p1)
	return p1.tag ~= nil and (p1.subtreeFlags ~= nil and (p1.lanes ~= nil and p1.childLanes ~= nil))
end

if var1 and not dEV then
	function t.get(p1)
		return p1._reactInternals
	end
else
	function t.get(p1)
		-- upvalues: error (ref), getComponentNameModule (ref), inspect (ref)
		local reactInternals = p1._reactInternals
		
		if not (reactInternals.tag ~= nil and (reactInternals.subtreeFlags ~= nil and (reactInternals.lanes ~= nil and reactInternals.childLanes ~= nil))) then
			error(error.new("invalid fiber in " .. (getComponentNameModule(p1) or "UNNAMED Component") .. " during get from ReactInstanceMap! " .. inspect(reactInternals)))
			
			return reactInternals
		elseif reactInternals.alternate ~= nil then
			local alternate = reactInternals.alternate
			
			if not (alternate.tag ~= nil and (alternate.subtreeFlags ~= nil and (alternate.lanes ~= nil and alternate.childLanes ~= nil))) then
				error(error.new("invalid alternate fiber (" .. (getComponentNameModule(p1) or "UNNAMED alternate") .. ") in " .. (getComponentNameModule(p1) or "UNNAMED Component") .. " during get from ReactInstanceMap! " .. inspect(reactInternals.alternate)))
			end
		end
		return reactInternals
	end
end
function t.has(p1)
	return p1._reactInternals ~= nil
end

if var1 and not dEV then
	function t.set(p1, p2)
		p1._reactInternals = p2
	end
	
	return t
end
function t.set(p1, p2)
	-- upvalues: getComponentNameModule (ref), inspect (ref), error (ref)
	local var2 = p2
	local _ = nil
	while var2 ~= nil do
		local var3 = var2
		local var4 = var3.tag ~= nil and (var3.subtreeFlags ~= nil and (var3.lanes ~= nil and var3.childLanes ~= nil))
		
		if not var4 then
			local text = "invalid fiber in " .. (getComponentNameModule(p1) or "UNNAMED Component") .. " being set in ReactInstanceMap! " .. inspect(var2) .. "\n"
			
			if p2 ~= var2 then
				text ..= " (from original fiber " .. getComponentNameModule(p1) or "UNNAMED Component" .. ")"
			end
			error(error.new(text))
		elseif var2.alternate ~= nil then
			local alternate = var2.alternate
			var4 = alternate.tag ~= nil and (alternate.subtreeFlags ~= nil and (alternate.lanes ~= nil and alternate.childLanes ~= nil))
			
			if not var4 then
				local text = "invalid alternate fiber (" .. (getComponentNameModule(p1) or "UNNAMED alternate") .. ") in " .. (getComponentNameModule(p1) or "UNNAMED Component") .. " being set in ReactInstanceMap! " .. inspect(var2.alternate) .. "\n"
				
				if p2 ~= var2 then
					text ..= " (from original fiber " .. getComponentNameModule(p1) or "UNNAMED Component" .. ")"
				end
				error(error.new(text))
			end
		end
		var2 = var2.return_
	end
	p1._reactInternals = p2
end

return t