const express = require("express");
const mysql = require("mysql");
const BancoDados = {
  host: "localhost",
  user: "root",
  password: "",
  database: "loja_dsapi",
};
const BD = mysql.createConnection(BancoDados);
const app = express();
const port = 8001;

app.use(express.json());

app.post("/clientes", (req, res) => {
  const { nome, altura, nascimento, cidade_id } = req.body;
  const cliente = {nome,altura,nascimento,cidade_id,};
  const query = "INSERT INTO clientes SET ?";

  BD.query(query, cliente, (error) => {
    if (error) {
      console.error("Erro ao cadastrar cliente:", error);
      res.status(500).json({ error: "Erro ao cadastrar na Tabela Cliente" });
    } else {
      res.json({ message: "Cliente cadastrado" });
    }
  });
});


app.get("/produtos", (req, res) => {
  const query = "SELECT * FROM produtos";

  BD.query(query, (error, results) => {
    if (error) {
      console.error("Erro ao consultar produtos:", error);
      res.status(500).json({ error: "Erro ao consultar Tabela Produtos" });
    } else {
      res.json(results);
    }
  });
});


app.post("/pedidos", (req, res) => {
  const { horario, endereco, cliente_id } = req.body;
  const pedido = {horario,endereco, cliente_id};
  const query = "INSERT INTO pedidos SET ?";

  BD.query(query, pedido, (error) => {
    if (error) {
      console.error("Erro na criaçãodo do pedido:", error);
      res.status(500).json({ error: "Erro na criaçãodo do pedido" });
    } else {
      res.json({ message: "Pedido Cadastrado" });;
    }
  });
});


app.get("/pedidos", (req, res) => {
  const query =
    "SELECT pedidos.id, pedidos.horario, pedidos.endereco, clientes.nome AS cliente_nome " +
    "FROM pedidos " +
    "INNER JOIN clientes ON pedidos.cliente_id = clientes.id";

  BD.query(query, (error, results) => {
    if (error) {
      console.error("Erro na consulta dos pedidos:", error);
      res.status(500).json({ error: "Erro ao consultar Tabela Pedidos" });
    } else {
      res.json(results);
    }
  });
});


app.post("/produtos", (req, res) => {
  const { nome, preco, quantidade, categoria_id } = req.body;
  const novoProduto = {nome,preco,quantidade,categoria_id,};
  const query = "INSERT INTO produtos SET ?";

  BD.query(query, novoProduto, (error) => {
    if (error) {
      console.error("Erro ao criar produto:", error);
      res.status(500).json({ error: "Erro ao criar produto" });
    } else {
      res.json({ message: "Produto criado" });
    }
  });
});


app.put("/produtos/:id", (req, res) => {
  const id = req.params.id;
  const { nome, preco, quantidade, categoria_id } = req.body;
  const alterarProd = {nome,preco,quantidade,categoria_id,};
  const query = "UPDATE produtos SET ? WHERE id = ?";

  BD.query(query, [alterarProd, id], (error) => {
    if (error) {
      console.error("Erro ao alterar produto:", error);
      res.status(500).json({ error: "Erro na alteração do produto" });
    } else {
      res.json({ message: "Produto atualizado" });
    }
  });
});


app.delete("/produtos/:id", (req, res) => {
  const id = req.params.id;
  const query = "DELETE FROM produtos WHERE id = ?";

  BD.query(query, id, (error) => {
    if (error) {
      console.error("Erro ao excluir produto:", error);
      res.status(500).json({ error: "Erro ao excluir produto" });
    } else {
      res.json({ message: "Produto excluído" });
    }
  });
});


app.listen(port, () => {
  console.log(`Servidor rodando na porta ${port}`);
});