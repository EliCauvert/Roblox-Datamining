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
	_fetchIcons = function(p0, p1, p2, p3, p4, p5, p6, p7)
		-- upvalues: resultModule (ref), thumbnail (ref), promiseModule (ref)
		local function _(p8)
			-- upvalues: p4 (ref), p5 (ref), p3 (ref)
			return p4({ targetId = p8, requestName = p5, iconSize = p3 })
		end
		
		local function getTableOfFailedResults(p9)
			-- upvalues: p4 (ref), p5 (ref), p3 (ref), resultModule (copy)
			local t = {}
			
			for i, v in pairs(p9) do
				t[p4({ targetId = v, requestName = p5, iconSize = p3 })] = resultModule.new(false, { targetId = v })
			end
			return t
		end
		
		return p6(p1, p2, p3):andThen(function(p10)
			-- upvalues: getTableOfFailedResults (ref), p2 (ref), thumbnail (copy), p3 (ref), p4 (ref), p5 (ref), resultModule (copy), p0 (ref), p7 (ref), promiseModule (copy)
			local var11 = getTableOfFailedResults(p2)
			local t = {}
			local data = p10 and (p10.responseBody and p10.responseBody.data)
			
			if typeof(data) == "table" then
				for i, v in pairs(data) do
					if thumbnail.isCompleteThumbnailData(v) then
						local var14 = tostring(v.targetId)
						local var15 = false
						
						if thumbnail.checkStateIsFinal(v.state) then
							t[var14] = thumbnail.fromThumbnailData(v, p3)
							var15 = true
						end
						var11[p4({ targetId = var14, requestName = p5, iconSize = p3 })] = resultModule.new(var15, v)
					end
				end
			end
			p0:dispatch(p7(t))
			
			return promiseModule.resolve(var11)
		end, function(_)
			-- upvalues: getTableOfFailedResults (ref), p2 (ref), promiseModule (copy)
			return promiseModule.resolve(getTableOfFailedResults(p2))
		end)
	end
}

function t._fetch(p11, p12, p13, p14, p15, p16, p17, p18)
	-- upvalues: t (ref), maxValue (write), maxValue_1 (write), thumbnail (ref), tutilsModule (ref), promiseModule (ref)
	return t._fetchIcons(p11, p12, p13, p14, p15, p16, p17, p18):andThen(function(p19)
		-- upvalues: maxValue (copy), maxValue_1 (copy), thumbnail (copy), tutilsModule (copy), promiseModule (copy), t (copy), p11 (ref), p12 (ref), p13 (ref), p14 (ref), p15 (ref), p16 (ref), p17 (ref), p18 (ref)
		local t_1 = {}
		local var17 = p19
		
		if _G.__TESTEZ_RUNNING_TEST__ then
			maxValue = 1
			maxValue_1 = 0.001
		end
		local function retry(p20)
			-- upvalues: var17 (write), thumbnail (copy), t_1 (ref), tutilsModule (copy), promiseModule (copy), maxValue_1 (copy), t (copy), p11 (copy), p12 (copy), p13 (copy), p14 (copy), p15 (copy), p16 (copy), p17 (copy), p18 (copy), retry (ref)
			local t_2 = {}
			
			for i, v in pairs(var17) do
				local var20, var21 = v:unwrap()
				
				if var20 and thumbnail.checkStateIsFinal(var21.state) then
					t_1[i] = v
				else
					table.insert(t_2, var21)
				end
			end
			return if tutilsModule.fieldCount(t_2) == 0 then promiseModule.resolve(t_1) else promiseModule.new(function(p22, _)
				-- upvalues: maxValue_1 (copy), p20 (ref)
				coroutine.wrap(function()
					-- upvalues: maxValue_1 (copy), p20 (copy), p22 (ref)
					wait(maxValue_1 * math.pow(2, p20 - 1))
					p22()
				end)()
			end):andThen(function()
				-- upvalues: t (copy), p11 (copy), p12 (copy), p13 (copy), p14 (copy), p15 (copy), p16 (copy), p17 (copy), p18 (copy)
				return t._fetchIcons(p11, p12, p13, p14, p15, p16, p17, p18)
			end):andThen(function(p21)
				-- upvalues: var17 (copy), p20 (ref), retry (copy), promiseModule (copy), t_1 (copy)
				var17 = p21
				
				return if p20 > 1 then retry(p20 - 1) else promiseModule.resolve(t_1)
			end)
		end
		
		return retry(maxValue)
	end)
end

function t.Fetch(p23, p24, p25, p26, p27, p28)
	-- upvalues: argCheckModule (ref), t (ref), performFetchModule (ref)
	argCheckModule.isType(p24, "table", "requests")
	argCheckModule.isType(p26, "string", "requestName")
	argCheckModule.isNonNegativeNumber(#p24, "requests count")
	t.KeyMapper = p25
	
	return performFetchModule.Batch(p24, p25, function(p29, p30)
		-- upvalues: t (copy), p23 (ref), p25 (ref), p26 (ref), p27 (ref), p28 (ref)
		local t_1 = {}
		local iconSize = nil
		
		for i, v in ipairs(p30) do
			iconSize = v.iconSize
			table.insert(t_1, v.targetId)
		end
		return t._fetch(p29, p23, t_1, iconSize, p25, p26, p27, p28)
	end)
end

return t