local parent = script:FindFirstAncestor("BuildExperience").Parent
local httpClientModule = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local debug = require(parent.DataHydration.CreatorAgentChat).debug
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return function(p1, p2)
	-- upvalues: debug (ref), promiseModule (ref), fetch (ref), asPromise (ref)
	p2 = p2 or "420x420"
	debug.log("info", "thumbnail_url polling", { assetId = p1 })
	
	return promiseModule.new(function(p3, p4)
		-- upvalues: fetch (copy), p1 (ref), p2 (ref), asPromise (copy), debug (copy)
		local var1 = 0
		
		local function poll(p5)
			-- upvalues: fetch (copy), p1 (copy), p2 (copy), asPromise (copy), p4 (ref), debug (copy), p3 (ref), var1 (write), poll (ref)
			asPromise(fetch({
				method = "POST",
				url = "https://thumbnails.roblox.com/v1/batch",
				analyticsKey = "build-experience.get-thumbnail-url",
				body = {
					{ type = "Asset", format = "Png", targetId = p1, size = p2 }
				},
				decode = function(p6)
					return p6
				end
			})):andThen(function(p6)
				-- upvalues: p4 (copy), debug (copy), p1 (copy), p3 (copy), var1 (copy), poll (copy), p5 (ref)
				local data = p6 and p6.data
				
				if not data or #data == 0 then
					p4("No thumbnail data returned")
					
					return
				end
				local var2 = data[1]
				
				if var2.state == "Completed" then
					debug.log("info", "thumbnail_url completed", { assetId = p1 })
					p3({ status = "completed", imageUrl = var2.imageUrl })
					
					return
				elseif var2.state == "InReview" then
					var1 += 1
					
					if var1 >= 5 then
						debug.log("warn", "thumbnail_url in_review timeout", { assetId = p1 })
						p3({ status = "in_review", assetId = p1 })
						
						return
					end
					task.delay(2, function()
						-- upvalues: poll (copy), p5 (copy)
						poll(p5 + 1)
					end)
					
					return
				elseif var2.state ~= "Pending" then
					p4(`Thumbnail failed: {var2.state}`)
					
					return
				elseif p5 >= 15 then
					debug.log("warn", "thumbnail_url timed out", { assetId = p1 })
					p4("Thumbnail generation timed out")
					
					return
				end
				task.delay(2, function()
					-- upvalues: poll (copy), p5 (copy)
					poll(p5 + 1)
				end)
			end):catch(function(p6)
				-- upvalues: p4 (copy)
				p4(p6)
			end)
		end
		
		poll(1)
	end)
end