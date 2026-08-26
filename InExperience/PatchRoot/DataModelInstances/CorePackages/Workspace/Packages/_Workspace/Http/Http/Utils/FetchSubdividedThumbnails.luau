local http = script:FindFirstAncestor("Http")
local parent = http.Parent
local thumbnail = require(http.Models).Thumbnail
local performFetchModule = require(http.PerformFetch)
local argCheckModule = require(parent.ArgCheck)
local promiseModule = require(parent.Promise)
local resultModule = require(parent.Result)
local tutilsModule = require(parent.tutils)
local maxValue = math.max(0, tonumber(settings():GetFVariable("LuaAppNonFinalThumbnailMaxRetries")) or 0)
local maxValue_1 = math.max(0, tonumber(settings():GetFVariable("LuaAppThumbnailsApiRetryTimeMultiplier")) or 0)
local t = {
	_fetchIcons = function(p1, p2, p3, p4, p5, p6, p7, p8)
		-- upvalues: resultModule (ref), thumbnail (ref), promiseModule (ref)
		local function _(p9)
			-- upvalues: p5 (ref), p6 (ref), p4 (ref)
			return p5({ targetId = p9, requestName = p6, iconSize = p4 })
		end
		
		local function getTableOfFailedResults(p9)
			-- upvalues: p5 (ref), p6 (ref), p4 (ref), resultModule (copy)
			local t = {}
			
			for i, v in pairs(p9) do
				t[p5({ targetId = v, requestName = p6, iconSize = p4 })] = resultModule.new(false, { targetId = v })
			end
			return t
		end
		
		return p7(p2, p3, p4):andThen(function(p10)
			-- upvalues: getTableOfFailedResults (ref), p3 (ref), thumbnail (copy), p4 (ref), p5 (ref), p6 (ref), resultModule (copy), p1 (ref), p8 (ref), promiseModule (copy)
			local var1 = getTableOfFailedResults(p3)
			local t = {}
			local data = p10 and (p10.responseBody and p10.responseBody.data)
			
			if typeof(data) == "table" then
				for i, v in pairs(data) do
					if thumbnail.isCompleteThumbnailData(v) then
						local var2 = tostring(v.targetId)
						local var3 = false
						
						if thumbnail.checkStateIsFinal(v.state) then
							t[var2] = thumbnail.fromThumbnailData(v, p4)
							var3 = true
						end
						var1[p5({ targetId = var2, requestName = p6, iconSize = p4 })] = resultModule.new(var3, v)
					end
				end
			end
			p1:dispatch(p8(t))
			
			return promiseModule.resolve(var1)
		end, function(_)
			-- upvalues: getTableOfFailedResults (ref), p3 (ref), promiseModule (copy)
			return promiseModule.resolve(getTableOfFailedResults(p3))
		end)
	end
}

function t._fetch(p10, p11, p12, p13, p14, p15, p16, p17)
	-- upvalues: t (ref), maxValue (write), maxValue_1 (write), thumbnail (ref), tutilsModule (ref), promiseModule (ref)
	return t._fetchIcons(p10, p11, p12, p13, p14, p15, p16, p17):andThen(function(p18)
		-- upvalues: maxValue (copy), maxValue_1 (copy), thumbnail (copy), tutilsModule (copy), promiseModule (copy), t (copy), p10 (ref), p11 (ref), p12 (ref), p13 (ref), p14 (ref), p15 (ref), p16 (ref), p17 (ref)
		local t_1 = {}
		local var1 = p18
		
		if _G.__TESTEZ_RUNNING_TEST__ then
			maxValue = 1
			maxValue_1 = 0.001
		end
		local function retry(p19)
			-- upvalues: var1 (write), thumbnail (copy), t_1 (ref), tutilsModule (copy), promiseModule (copy), maxValue_1 (copy), t (copy), p10 (copy), p11 (copy), p12 (copy), p13 (copy), p14 (copy), p15 (copy), p16 (copy), p17 (copy), retry (ref)
			local t_2 = {}
			
			for i, v in pairs(var1) do
				local var2, var3 = v:unwrap()
				
				if var2 and thumbnail.checkStateIsFinal(var3.state) then
					t_1[i] = v
				else
					table.insert(t_2, var3)
				end
			end
			return if tutilsModule.fieldCount(t_2) == 0 then promiseModule.resolve(t_1) else promiseModule.new(function(p20, _)
				-- upvalues: maxValue_1 (copy), p19 (ref)
				coroutine.wrap(function()
					-- upvalues: maxValue_1 (copy), p19 (copy), p20 (ref)
					wait(maxValue_1 * math.pow(2, p19 - 1))
					p20()
				end)()
			end):andThen(function()
				-- upvalues: t (copy), p10 (copy), p11 (copy), p12 (copy), p13 (copy), p14 (copy), p15 (copy), p16 (copy), p17 (copy)
				return t._fetchIcons(p10, p11, p12, p13, p14, p15, p16, p17)
			end):andThen(function(p20)
				-- upvalues: var1 (copy), p19 (ref), retry (copy), promiseModule (copy), t_1 (copy)
				var1 = p20
				
				return if p19 > 1 then retry(p19 - 1) else promiseModule.resolve(t_1)
			end)
		end
		
		return retry(maxValue)
	end)
end

function t.Fetch(p18, p19, p20, p21, p22, p23)
	-- upvalues: argCheckModule (ref), t (ref), performFetchModule (ref)
	argCheckModule.isType(p19, "table", "requests")
	argCheckModule.isType(p21, "string", "requestName")
	argCheckModule.isNonNegativeNumber(#p19, "requests count")
	t.KeyMapper = p20
	
	return performFetchModule.Batch(p19, p20, function(p24, p25)
		-- upvalues: t (copy), p18 (ref), p20 (ref), p21 (ref), p22 (ref), p23 (ref)
		local t_1 = {}
		local iconSize = nil
		
		for i, v in ipairs(p25) do
			iconSize = v.iconSize
			table.insert(t_1, v.targetId)
		end
		return t._fetch(p24, p18, t_1, iconSize, p20, p21, p22, p23)
	end)
end

return t