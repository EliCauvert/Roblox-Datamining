local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Error1 = LuauPolyfillModule.Error
local InspectFunction = LuauPolyfillModule.util.inspect
local GetComponentNameModule = require(script.Parent.getComponentName)
local DEV = require(Parent.ReactGlobals).__DEV__
local v1 = require(Parent.SafeFlags).createGetFFlag("ReactInstanceMapDisableErrorChecking")()

local function _(p1): boolean
	return p1.tag ~= nil and (p1.subtreeFlags ~= nil and (p1.lanes ~= nil and p1.childLanes ~= nil))
end

local ReactInstanceMapModule = {
	remove = function(p1)
		p1._reactInternals = nil
	end
}

if v1 and not DEV then
	function ReactInstanceMapModule.get(p1)
		return p1._reactInternals
	end
else
	function ReactInstanceMapModule.get(p1)
		-- upvalues: Error1 (copy), GetComponentNameModule (copy), InspectFunction (copy)
		local ReactInternals = p1._reactInternals
		
		if ReactInternals.tag == nil or (ReactInternals.subtreeFlags == nil or (ReactInternals.lanes == nil or ReactInternals.childLanes == nil)) then
			error(Error1.new("invalid fiber in " .. (GetComponentNameModule(p1) or "UNNAMED Component") .. " during get from ReactInstanceMap! " .. InspectFunction(ReactInternals)))
			
			return ReactInternals
		end
		if ReactInternals.alternate ~= nil then
			local Alternate = ReactInternals.alternate
			
			if Alternate.tag == nil or (Alternate.subtreeFlags == nil or (Alternate.lanes == nil or Alternate.childLanes == nil)) then
				error(Error1.new("invalid alternate fiber (" .. (GetComponentNameModule(p1) or "UNNAMED alternate") .. ") in " .. (GetComponentNameModule(p1) or "UNNAMED Component") .. " during get from ReactInstanceMap! " .. InspectFunction(ReactInternals.alternate)))
			end
		end
		return ReactInternals
	end
end
function ReactInstanceMapModule.has(p1): boolean
	return p1._reactInternals ~= nil
end

if v1 and not DEV then
	function ReactInstanceMapModule.set(p1, _reactInternals)
		p1._reactInternals = _reactInternals
	end
	
	return ReactInstanceMapModule
else
	function ReactInstanceMapModule.set(p1, Return)
		-- upvalues: GetComponentNameModule (copy), InspectFunction (copy), Error1 (copy)
		local Return1 = Return
		while Return1 ~= nil do
			if Return1.tag ~= nil and (Return1.subtreeFlags ~= nil and (Return1.lanes ~= nil and Return1.childLanes ~= nil)) then
				local NoAlternate = Return1.alternate == nil
				
				if not NoAlternate then
					local Alternate = Return1.alternate
					NoAlternate = Alternate.tag ~= nil and (Alternate.subtreeFlags ~= nil and (Alternate.lanes ~= nil and Alternate.childLanes ~= nil))
				end
				if not NoAlternate then
					local Text = "invalid alternate fiber (" .. (GetComponentNameModule(p1) or "UNNAMED alternate") .. ") in " .. (GetComponentNameModule(p1) or "UNNAMED Component") .. " being set in ReactInstanceMap! " .. InspectFunction(Return1.alternate) .. "\n"
					
					if Return ~= Return1 then
						Text ..= " (from original fiber " .. GetComponentNameModule(p1) or "UNNAMED Component" .. ")"
					end
					error(Error1.new(Text))
				end
			else
				local Text = "invalid fiber in " .. (GetComponentNameModule(p1) or "UNNAMED Component") .. " being set in ReactInstanceMap! " .. InspectFunction(Return1) .. "\n"
				
				if Return ~= Return1 then
					Text ..= " (from original fiber " .. GetComponentNameModule(p1) or "UNNAMED Component" .. ")"
				end
				error(Error1.new(Text))
			end
			Return1 = Return1.return_
		end
		p1._reactInternals = Return
	end
	
	return ReactInstanceMapModule
end