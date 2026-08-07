local parent = script:FindFirstAncestor("ExpChat").Parent
local roactModule = require(parent.Roact)
local reactModule = require(parent.React)
local dictionary = require(parent.llama).Dictionary

local function mapStringToBeLocalized(p0, p1) --[[ line: 9 ]]
	if type(p1) == "table" then
		local ok, status = pcall(function() --[[ line: 11 ]]
			-- upvalues: p0 (ref), p1 (ref)
			return p0:FormatByKey(p1[1], p1[2])
		end)
		
		return if ok then status else ""
	elseif type(p1) ~= "string" then
		return ""
	end
	local ok, status = pcall(function() --[[ line: 21 ]]
		-- upvalues: p0 (ref), p1 (ref)
		return p0:FormatByKey(p1)
	end)
	
	return if ok then status else ""
end

local function _(p2) --[[ line: 35 | named "getConnect" ]]
	-- upvalues: dictionary (ref), mapStringToBeLocalized (ref), roactModule (ref)
	return function(p3) --[[ line: 36 ]]
		-- upvalues: dictionary (copy), mapStringToBeLocalized (copy), roactModule (copy), p2 (ref)
		local function transformedMapper(p4, p5) --[[ line: 37 ]]
			-- upvalues: dictionary (copy), p3 (ref), mapStringToBeLocalized (copy)
			return dictionary.map(p3(p5), function(p6, _) --[[ line: 38 ]]
				-- upvalues: mapStringToBeLocalized (copy), p4 (ref)
				return mapStringToBeLocalized(p4, p6)
			end)
		end
		
		return function(p7) --[[ line: 43 ]]
			-- upvalues: roactModule (copy), p2 (copy), dictionary (copy), transformedMapper (ref)
			local var4 = roactModule.Component:extend("Connected-" .. tostring(p7))
			
			function var4.render(p8) --[[ line: 46 ]]
				-- upvalues: roactModule (copy), p2 (copy), p7 (ref), dictionary (copy), transformedMapper (copy)
				return roactModule.createElement(p2.Consumer, {
					render = function(p9) --[[ line: 48 ]]
						-- upvalues: roactModule (copy), p7 (copy), dictionary (copy), p8 (ref), transformedMapper (copy)
						return roactModule.createElement(p7, dictionary.join(p8.props, transformedMapper(p9, p8.props)))
					end
				})
			end
			
			return var4
		end
	end
end

local _ = function(p10) --[[ line: 62 | named "getUseLocalization" ]]
	-- upvalues: reactModule (ref), dictionary (ref), mapStringToBeLocalized (ref)
	return function(p11) --[[ line: 63 ]]
		-- upvalues: reactModule (copy), p10 (ref), dictionary (copy), mapStringToBeLocalized (copy)
		local var5 = reactModule.useContext(p10)
		
		return dictionary.map(p11, function(p12, _) --[[ line: 65 ]]
			-- upvalues: mapStringToBeLocalized (copy), var5 (ref)
			return mapStringToBeLocalized(var5, p12)
		end)
	end
end

return function(p13) --[[ line: 71 ]]
	-- upvalues: roactModule (ref), dictionary (ref), mapStringToBeLocalized (ref), reactModule (ref)
	local var6 = roactModule.createContext(p13)
	
	return {
		Consumer = var6.Consumer,
		Provider = var6.Provider,
		connect = function(p14) --[[ line: 36 ]]
			-- upvalues: dictionary (copy), mapStringToBeLocalized (copy), roactModule (copy), var6 (ref)
			local function transformedMapper(p15, p16) --[[ line: 37 ]]
				-- upvalues: dictionary (copy), p14 (ref), mapStringToBeLocalized (copy)
				return dictionary.map(p14(p16), function(p17, _) --[[ line: 38 ]]
					-- upvalues: mapStringToBeLocalized (copy), p15 (ref)
					return mapStringToBeLocalized(p15, p17)
				end)
			end
			
			return function(p18) --[[ line: 43 ]]
				-- upvalues: roactModule (copy), var6 (copy), dictionary (copy), transformedMapper (ref)
				local var4 = roactModule.Component:extend("Connected-" .. tostring(p18))
				
				function var4.render(p19) --[[ line: 46 ]]
					-- upvalues: roactModule (copy), var6 (copy), p18 (ref), dictionary (copy), transformedMapper (copy)
					return roactModule.createElement(var6.Consumer, {
						render = function(p20) --[[ line: 48 ]]
							-- upvalues: roactModule (copy), p18 (copy), dictionary (copy), p19 (ref), transformedMapper (copy)
							return roactModule.createElement(p18, dictionary.join(p19.props, transformedMapper(p20, p19.props)))
						end
					})
				end
				
				return var4
			end
		end,
		useLocalization = function(p21) --[[ line: 63 ]]
			-- upvalues: reactModule (copy), var6 (ref), dictionary (copy), mapStringToBeLocalized (copy)
			local var5 = reactModule.useContext(var6)
			
			return dictionary.map(p21, function(p22, _) --[[ line: 65 ]]
				-- upvalues: mapStringToBeLocalized (copy), var5 (ref)
				return mapStringToBeLocalized(var5, p22)
			end)
		end
	}
end