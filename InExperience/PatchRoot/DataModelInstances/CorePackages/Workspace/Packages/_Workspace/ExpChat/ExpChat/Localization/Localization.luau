local parent = script:FindFirstAncestor("ExpChat").Parent
local roactModule = require(parent.Roact)
local reactModule = require(parent.React)
local dictionary = require(parent.llama).Dictionary

local function mapStringToBeLocalized(p1, p2)
	if type(p2) == "table" then
		local ok, status = pcall(function()
			-- upvalues: p1 (ref), p2 (ref)
			return p1:FormatByKey(p2[1], p2[2])
		end)
		
		return if ok then status else ""
	elseif type(p2) ~= "string" then
		return ""
	end
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), p2 (ref)
		return p1:FormatByKey(p2)
	end)
	
	return if ok then status else ""
end

local function _(p1)
	-- upvalues: dictionary (ref), mapStringToBeLocalized (ref), roactModule (ref)
	return function(p2)
		-- upvalues: dictionary (copy), mapStringToBeLocalized (copy), roactModule (copy), p1 (ref)
		local function transformedMapper(p3, p4)
			-- upvalues: dictionary (copy), p2 (ref), mapStringToBeLocalized (copy)
			return dictionary.map(p2(p4), function(p5, _)
				-- upvalues: mapStringToBeLocalized (copy), p3 (ref)
				return mapStringToBeLocalized(p3, p5)
			end)
		end
		
		return function(p3)
			-- upvalues: roactModule (copy), p1 (copy), dictionary (copy), transformedMapper (ref)
			local var1 = roactModule.Component:extend("Connected-" .. tostring(p3))
			
			function var4.render(p4)
				-- upvalues: roactModule (copy), p1 (copy), p3 (ref), dictionary (copy), transformedMapper (copy)
				return roactModule.createElement(p1.Consumer, {
					render = function(p5)
						-- upvalues: roactModule (copy), p3 (copy), dictionary (copy), p4 (ref), transformedMapper (copy)
						return roactModule.createElement(p3, dictionary.join(p4.props, transformedMapper(p5, p4.props)))
					end
				})
			end
			
			return var1
		end
	end
end

local _ = function(p1)
	-- upvalues: reactModule (ref), dictionary (ref), mapStringToBeLocalized (ref)
	return function(p2)
		-- upvalues: reactModule (copy), p1 (ref), dictionary (copy), mapStringToBeLocalized (copy)
		local var1 = reactModule.useContext(p1)
		
		return dictionary.map(p2, function(p3, _)
			-- upvalues: mapStringToBeLocalized (copy), var1 (ref)
			return mapStringToBeLocalized(var1, p3)
		end)
	end
end

return function(p1)
	-- upvalues: roactModule (ref), dictionary (ref), mapStringToBeLocalized (ref), reactModule (ref)
	local var1 = roactModule.createContext(p1)
	
	return {
		Consumer = var1.Consumer,
		Provider = var1.Provider,
		connect = function(p2)
			-- upvalues: dictionary (copy), mapStringToBeLocalized (copy), roactModule (copy), var1 (ref)
			local function transformedMapper(p3, p4)
				-- upvalues: dictionary (copy), p2 (ref), mapStringToBeLocalized (copy)
				return dictionary.map(p2(p4), function(p5, _)
					-- upvalues: mapStringToBeLocalized (copy), p3 (ref)
					return mapStringToBeLocalized(p3, p5)
				end)
			end
			
			return function(p3)
				-- upvalues: roactModule (copy), var1 (copy), dictionary (copy), transformedMapper (ref)
				local var2 = roactModule.Component:extend("Connected-" .. tostring(p3))
				
				function var4.render(p4)
					-- upvalues: roactModule (copy), var1 (copy), p3 (ref), dictionary (copy), transformedMapper (copy)
					return roactModule.createElement(var1.Consumer, {
						render = function(p5)
							-- upvalues: roactModule (copy), p3 (copy), dictionary (copy), p4 (ref), transformedMapper (copy)
							return roactModule.createElement(p3, dictionary.join(p4.props, transformedMapper(p5, p4.props)))
						end
					})
				end
				
				return var2
			end
		end,
		useLocalization = function(p2)
			-- upvalues: reactModule (copy), var1 (ref), dictionary (copy), mapStringToBeLocalized (copy)
			local var2 = reactModule.useContext(var1)
			
			return dictionary.map(p2, function(p3, _)
				-- upvalues: mapStringToBeLocalized (copy), var2 (ref)
				return mapStringToBeLocalized(var2, p3)
			end)
		end
	}
end