local parent = script:FindFirstAncestor("ExpChat").Parent
local reactModule = require(parent.React)
local dictionary = require(parent.llama).Dictionary

local function _(p0)
	-- upvalues: dictionary (ref), reactModule (ref)
	return function(p1)
		-- upvalues: dictionary (copy), reactModule (copy), p0 (ref)
		local function transformedMapper(p2, p3)
			-- upvalues: dictionary (copy), p1 (ref)
			return dictionary.map(p1(p3), function(p4, _)
				-- upvalues: p2 (ref)
				local ok, status = pcall(function()
					-- upvalues: p2 (copy), p4 (ref)
					return p2:TranslateGameText(game, p4)
				end)
				
				return if ok then status else ""
			end)
		end
		
		return function(p5)
			-- upvalues: reactModule (copy), p0 (copy), dictionary (copy), transformedMapper (ref)
			local var2 = reactModule.Component:extend("Connected-" .. tostring(p5))
			
			function var2.render(p6)
				-- upvalues: reactModule (copy), p0 (copy), p5 (ref), dictionary (copy), transformedMapper (copy)
				return reactModule.createElement(p0.Consumer, {
					render = function(p7)
						-- upvalues: reactModule (copy), p5 (copy), dictionary (copy), p6 (ref), transformedMapper (copy)
						return reactModule.createElement(p5, dictionary.join(p6.props, transformedMapper(p7, p6.props)))
					end
				})
			end
			
			return var2
		end
	end
end

return function(p8)
	-- upvalues: reactModule (ref), dictionary (ref)
	local var3 = reactModule.createContext(p8)
	
	return {
		Consumer = var3.Consumer,
		Provider = var3.Provider,
		connect = function(p9)
			-- upvalues: dictionary (copy), reactModule (copy), var3 (ref)
			local function transformedMapper(p10, p11)
				-- upvalues: dictionary (copy), p9 (ref)
				return dictionary.map(p9(p11), function(p12, _)
					-- upvalues: p10 (ref)
					local ok, status = pcall(function()
						-- upvalues: p10 (copy), p12 (ref)
						return p10:TranslateGameText(game, p12)
					end)
					
					return if ok then status else ""
				end)
			end
			
			return function(p13)
				-- upvalues: reactModule (copy), var3 (copy), dictionary (copy), transformedMapper (ref)
				local var2 = reactModule.Component:extend("Connected-" .. tostring(p13))
				
				function var2.render(p14)
					-- upvalues: reactModule (copy), var3 (copy), p13 (ref), dictionary (copy), transformedMapper (copy)
					return reactModule.createElement(var3.Consumer, {
						render = function(p15)
							-- upvalues: reactModule (copy), p13 (copy), dictionary (copy), p14 (ref), transformedMapper (copy)
							return reactModule.createElement(p13, dictionary.join(p14.props, transformedMapper(p15, p14.props)))
						end
					})
				end
				
				return var2
			end
		end
	}
end