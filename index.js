
app.get("/aula", async (req, res) => {
    try {
        // realiza a consulta ao banco de dados:
        const resultado = await db.pool.query("SELECT * FROM aula")
        res.status(200).json(resultado[0])
    } catch (erro) {
        res.status(500).json({erro: erro.message})
    }
})

app.post("/aula" , async (req, res) => {
 try {
    const dados = req.body
    const resultado = await db.pool.query(
        "INSERT INTO aula ( serie, turma,componente, professor) VALUES (?, ?, ?, ?)", 
         [dados.serie, dados.turma, dados.componente, dados,professor]
    )
 } catch (erro) {
    res.status(500).json({erro: erro.message})
 }
})

app.listen(port, ()=>{
    console.log("API rodando na porta " + port)
})

// No Rapid Client:
// GET http://127.0.0.1:3000/aula
