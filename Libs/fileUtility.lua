--simple file managing library by MCBE Craft

function readFile(file)
    if fileExists(file) then
        local lines = io.lines(file)
        local result = {}
        for line in lines do 
            table.insert(result, line)
        end
        print("file " .. file .. " found")
        return result
    else
        print("file " .. file .. " not found")
        return {}
    end
end

function readWholeFile(file)
    local f = io.open(file, "r")
    if f then
        local content = f:read("a")
        f:close()
        return content
    else
        return nil
    end
end

function writeFile(file, text)
    local wrFile = io.open(file, "w")
    io.output(wrFile)
    io.write(text)
    io.close(wrFile)
end

function jsonLoad(file)
    local content = readWholeFile(file)
    return jsonToTable(content)
end

function jsonDump(json, file)
    writeFile(file, tableToJson(json))
end

function split(str, splitter)
    local result = {}
    for s in string.gmatch(str, "([^" .. splitter .. "]+)") do
        table.insert(result, s)
    end
    return result
end

function fileExists(file)
    return fs.exist(file)
end
