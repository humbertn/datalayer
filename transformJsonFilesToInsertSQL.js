const fs = require('fs');
const path = require('path');

const jsonFilesDir = './USA';
const tableName = 'County';

fs.readdir(jsonFilesDir, (err, files) => {
  if (err) {
    console.error('Error reading directory:', err);
    return;
  }

  files.forEach(file => {
    const filePath = path.join(jsonFilesDir, file);

    fs.readFile(filePath, 'utf8', (err, data) => {
      if (err) {
        console.error('Error reading file:', err);
        return;
      }

      try {
        const stateName = path.parse(file).name;
        const jsonData = JSON.parse(data);
        let queryString = `INSERT INTO ${tableName} (state, county, population)\nVALUES\n`;
        
        const insertStatements = jsonData.map(item => {
          const { county, population } = item;
          return `('${stateName.replace('\'', '\'\'')}', '${county.replace('\'', '\'\'')}', ${population}),`;
        });

        console.log(`-- File: ${file}`);
        let lastCounty = insertStatements.pop();
        lastCounty = lastCounty.replace('),', ');');
        insertStatements.push(lastCounty);
        queryString += insertStatements.join('\n');
        fs.writeFileSync(`./sql-files/state-${stateName.replace(' ', '-')}.sql`, queryString);
      } catch (parseError) {
        console.error('Error parsing JSON:', parseError);
      }
    });
  });    
});
